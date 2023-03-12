package com.example.animeweb.models;

import com.example.animeweb.repositories.ImageRepository;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "anime")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Anime {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "title")
    private String title;
    @Column(name = "type")
    private String type;
    @Column(name = "episodes")
    private int episodes;
    @Column(name = "status")
    private String status;
    @Column(name = "genre")
    private String genre;
    @Column(name = "studio")
    private String studio;
    @Column(name = "ageLimit")
    private String ageLimit;
    @Column(name = "director")
    private String director;
    @Column(name = "description", columnDefinition = "text")
    private String description;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
            mappedBy = "anime")
    private List<Image> imageList = new ArrayList<>();
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;
    private LocalDateTime dateOfCreated;

    private void init() {
        dateOfCreated = LocalDateTime.now();
    }

    public void addImageToAnime(Image image) {
        image.setAnime(this);
        imageList.add(image);
    }

    private Long previewImageId;

    public String getShortDescription(){
        if (description.length() >534){
            return description.substring(0,534) + "...";
        }
        return description;
    }

    public String getTitle() {
        return this.title;
    }

    public String getType() {
        return this.type;
    }

    public int getEpisodes() {
        return this.episodes;
    }

    public String getStatus() {
        return this.status;
    }

    public String getGenre() {
        return this.genre;
    }

    public String getStudio() {
        return this.studio;
    }

    public String getAgeLimit() {
        return this.ageLimit;
    }

    public String getDirector() {
        return this.director;
    }

    public String getDescription() {
        return this.description;
    }

    public void setTitle(String title) {
        title.trim();
        title.replace(" ", "-");
        this.title = title;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setEpisodes(int episodes) {
        this.episodes = episodes;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setStudio(String Studio) {
        this.studio = Studio;
    }

    public void setAgeLimit(String ageLimit) {
        this.ageLimit = ageLimit;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean equals(final Object o) {
        if (o == this) return true;
        if (!(o instanceof Anime)) return false;
        final Anime other = (Anime) o;
        if (!other.canEqual((Object) this)) return false;
        final Object this$title = this.getTitle();
        final Object other$title = other.getTitle();
        if (this$title == null ? other$title != null : !this$title.equals(other$title)) return false;
        final Object this$type = this.getType();
        final Object other$type = other.getType();
        if (this$type == null ? other$type != null : !this$type.equals(other$type)) return false;
        if (this.getEpisodes() != other.getEpisodes()) return false;
        final Object this$status = this.getStatus();
        final Object other$status = other.getStatus();
        if (this$status == null ? other$status != null : !this$status.equals(other$status)) return false;
        final Object this$genre = this.getGenre();
        final Object other$genre = other.getGenre();
        if (this$genre == null ? other$genre != null : !this$genre.equals(other$genre)) return false;
        final Object this$Studio = this.getStudio();
        final Object other$Studio = other.getStudio();
        if (this$Studio == null ? other$Studio != null : !this$Studio.equals(other$Studio)) return false;
        final Object this$ageLimit = this.getAgeLimit();
        final Object other$ageLimit = other.getAgeLimit();
        if (this$ageLimit == null ? other$ageLimit != null : !this$ageLimit.equals(other$ageLimit)) return false;
        final Object this$director = this.getDirector();
        final Object other$director = other.getDirector();
        if (this$director == null ? other$director != null : !this$director.equals(other$director)) return false;
        final Object this$description = this.getDescription();
        final Object other$description = other.getDescription();
        if (this$description == null ? other$description != null : !this$description.equals(other$description))
            return false;
        return true;
    }

    protected boolean canEqual(final Object other) {
        return other instanceof Anime;
    }

    public int hashCode() {
        final int PRIME = 59;
        int result = 1;
        final Object $title = this.getTitle();
        result = result * PRIME + ($title == null ? 43 : $title.hashCode());
        final Object $type = this.getType();
        result = result * PRIME + ($type == null ? 43 : $type.hashCode());
        result = result * PRIME + this.getEpisodes();
        final Object $status = this.getStatus();
        result = result * PRIME + ($status == null ? 43 : $status.hashCode());
        final Object $genre = this.getGenre();
        result = result * PRIME + ($genre == null ? 43 : $genre.hashCode());
        final Object $Studio = this.getStudio();
        result = result * PRIME + ($Studio == null ? 43 : $Studio.hashCode());
        final Object $ageLimit = this.getAgeLimit();
        result = result * PRIME + ($ageLimit == null ? 43 : $ageLimit.hashCode());
        final Object $director = this.getDirector();
        result = result * PRIME + ($director == null ? 43 : $director.hashCode());
        final Object $description = this.getDescription();
        result = result * PRIME + ($description == null ? 43 : $description.hashCode());
        return result;
    }

    public String toString() {
        return "Anime(title=" + this.getTitle() + ", type=" + this.getType() + ", episodes=" + this.getEpisodes() + ", status=" + this.getStatus() + ", genre=" + this.getGenre() + ", Studio=" + this.getStudio() + ", ageLimit=" + this.getAgeLimit() + ", director=" + this.getDirector() + ", description=" + this.getDescription() + ")";
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
