package com.example.animeweb.services;

import com.example.animeweb.models.Anime;
import com.example.animeweb.models.Image;
import com.example.animeweb.models.User;
import com.example.animeweb.repositories.AnimeRepository;
import com.example.animeweb.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class AnimeService {

    private final AnimeRepository animeRepository;
    private final UserRepository userRepository;

    public List<Anime> animeList(String title) {
        if (title != null) {
            return animeRepository.findByTitle(title);
        }
        return animeRepository.findAll();
    }

    public void saveAnime(Principal principal, Anime anime, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        anime.setUser(getUserByPrincipal(principal));
        addImageToAnime(anime, file1, file2, file3);
        log.info("Saving new Anime. Title: {}; Director{}", anime.getTitle(), anime.getDirector());
        Anime animeFromDb = animeRepository.save(anime);
        animeFromDb.setPreviewImageId(animeFromDb.getImageList().get(0).getId());
        animeRepository.save(anime);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteAnime(Long id) {
        animeRepository.deleteById(id);
    }

    public void editAnime(Anime anime) {
        animeRepository.save(anime);
    }

    public Anime getAnimeById(Long id) {
        return animeRepository.findById(id).orElse(null);
    }

    public void addImageToAnime(Anime anime, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        Image image1;
        Image image2;
        Image image3;

        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setIsPreviewImage(true);
            anime.addImageToAnime(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            anime.addImageToAnime(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            anime.addImageToAnime(image3);
        }
    }
}
