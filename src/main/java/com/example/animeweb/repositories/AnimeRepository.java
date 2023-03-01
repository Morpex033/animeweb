package com.example.animeweb.repositories;

import com.example.animeweb.models.Anime;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AnimeRepository extends JpaRepository<Anime, Long> {
    List<Anime> findByTitle(String title);
}
