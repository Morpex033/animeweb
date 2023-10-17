package com.example.animeweb.services;

import com.example.animeweb.models.Image;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
@Slf4j
@RequiredArgsConstructor
public class ImageService {
    private static final String APP_DIRECTORY = System.getProperty("user.dir");
    private static final String FILE_PATH = Paths.get(APP_DIRECTORY, "src", "main", "resources", "image").toString();

    public Image saveImage(MultipartFile file, String title) throws IOException {
        byte[] bytes = file.getBytes();

        Path path = Path.of("%s/%s/%s".formatted(FILE_PATH, title, file.getOriginalFilename()));
        Files.createDirectories(path.getParent());
        Files.write(path, bytes);

        return toImageEntity(file, path);
    }

    private Image toImageEntity(MultipartFile file, Path path) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        image.setPath(path.toString());
        return image;
    }
}
