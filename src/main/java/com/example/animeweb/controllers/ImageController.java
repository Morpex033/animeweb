package com.example.animeweb.controllers;

import com.example.animeweb.models.Image;
import com.example.animeweb.repositories.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayInputStream;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

@RestController
@RequiredArgsConstructor
public class ImageController {
    private final ImageRepository imageRepository;

    @GetMapping("/images/{id}")
    public ResponseEntity<InputStreamResource> getImageById(@PathVariable Long id) {
        Optional<Image> optionalImage = imageRepository.findById(id);

        if (optionalImage.isEmpty()) {
            return ResponseEntity.notFound().build();
        }

        Image image = optionalImage.get();

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + image.getOriginalFileName());
        headers.setContentType(MediaType.valueOf(image.getContentType()));
        headers.setContentLength(image.getSize());

        CacheControl cacheControl = CacheControl.maxAge(1, TimeUnit.DAYS);

        return ResponseEntity.ok()
                .headers(headers)
                .cacheControl(cacheControl)
                .body(new InputStreamResource(new ByteArrayInputStream(image.getBytes())));
    }
}
