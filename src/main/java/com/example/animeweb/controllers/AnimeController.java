package com.example.animeweb.controllers;

import com.example.animeweb.models.Anime;
import com.example.animeweb.services.AnimeService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequestMapping("/anime")
@RequiredArgsConstructor
public class AnimeController {
    private static AnimeService animeService;

    @Autowired
    public AnimeController(AnimeService animeService) {
        this.animeService = animeService;
    }

    @GetMapping()
    public String animeList(@RequestParam(name = "title", required = false) String title, Model model) {
        model.addAttribute("anime", animeService.animeList(title));
        return "animeList";
    }

    @GetMapping("/{title}-{id}")
    public String anime(Model model, @PathVariable("title") String title, @PathVariable Long id) {
        Anime anime = animeService.getAnimeById(id);
        model.addAttribute("anime", anime);
        model.addAttribute("images", anime.getImageList());
        return "anime";
    }

    @PostMapping("/delete/{title}-{id}")
    public String delete(@PathVariable("title") String title, @PathVariable Long id) {
        animeService.deleteAnime(id);
        return "redirect:/anime";
    }

    @GetMapping("/create")
    public String addAnime() {
        return "create";
    }

    @PostMapping("/create")
    public String create(Anime anime,
                         @RequestParam("file1") MultipartFile file1,
                         @RequestParam("file2") MultipartFile file2,
                         @RequestParam("file3") MultipartFile file3) throws IOException {
        animeService.saveAnime(anime, file1, file2, file3);
        return "redirect:/anime";
    }
}
