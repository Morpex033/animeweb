package com.example.animeweb.controllers;

import com.example.animeweb.models.Anime;
import com.example.animeweb.services.AnimeService;
import com.example.animeweb.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class AnimeController {
    private final AnimeService animeService;

    @GetMapping("/")
    public String index(){
        return "redirect:/anime";
    }

    @GetMapping("/anime")
    public String animeList(@RequestParam(name = "title", required = false) String title, Model model,
                            Principal principal) {
        model.addAttribute("anime", animeService.animeList(title));
        model.addAttribute("user", animeService.getUserByPrincipal(principal));
        return "animeList";
    }

    @GetMapping("/anime/{title}-{id}")
    public String anime(Model model, @PathVariable("title") String title, @PathVariable Long id, Principal principal) {
        Anime anime = animeService.getAnimeById(id);
        model.addAttribute("anime", anime);
        model.addAttribute("images", anime.getImageList());
        model.addAttribute("user", animeService.getUserByPrincipal(principal));
        return "anime";
    }

    @PostMapping("/anime/delete/{title}-{id}")
    public String delete(@PathVariable("title") String title, @PathVariable Long id) {
        animeService.deleteAnime(id);
        return "redirect:/anime";
    }

    @GetMapping("/anime/create")
    public String addAnime() {
        return "create";
    }

    @PostMapping("/anime/create")
    public String create(Anime anime,
                         @RequestParam("file1") MultipartFile file1,
                         @RequestParam("file2") MultipartFile file2,
                         @RequestParam("file3") MultipartFile file3, Principal principal) throws IOException {
        animeService.saveAnime(principal, anime, file1, file2, file3);
        return "redirect:/anime";
    }

    @GetMapping("/anime/edit/{title}-{id}")
    public String edit(@PathVariable String title, @PathVariable Long id, Model model) {
        model.addAttribute("anime", animeService.getAnimeById(id));
        return "edit";
    }

    @PostMapping("/anime/edit/{title}-{id}")
    public String editAnime(@PathVariable String title, @PathVariable Long id, Anime anime,
                            @RequestParam("file1") MultipartFile file1,
                            @RequestParam("file2") MultipartFile file2,
                            @RequestParam("file3") MultipartFile file3) throws IOException {

        animeService.editAnime(anime, file1, file2, file3);
        return "redirect:/anime";
    }
}
