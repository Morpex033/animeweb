package com.example.animeweb.services;

import com.example.animeweb.models.Anime;
import com.example.animeweb.models.Image;
import com.example.animeweb.repositories.AnimeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class AnimeService {

    private final AnimeRepository animeRepository;

    public List<Anime> animeList(String title) {
        if (title != null) {
            return animeRepository.findByTitle(title);
        }
        return animeRepository.findAll();
    }

    public void saveAnime(Anime anime, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
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
        log.info("Saving new Anime. Title: {}; Director{}", anime.getTitle(), anime.getDirector());
        Anime animeFromDb = animeRepository.save(anime);
        animeFromDb.setPreviewImageId(animeFromDb.getImageList().get(0).getId());
        animeRepository.save(anime);
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

    public Anime getAnimeById(Long id) {
        return animeRepository.findById(id).orElse(null);
    }
}
