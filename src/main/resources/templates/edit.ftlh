<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Create</title>
    <#import "styles/css.ftlh" as style>
    <@style.index></@style.index>
</head>
<body>
<a href="/anime"><input type="submit" value="Home page"></a>
<hr>
<form method="post" action="/anime/edit/${anime.title}-${anime.id}" enctype="multipart/form-data">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <label for="title"><b>Enter title: </b></label>
    <input type="text" name="title" value="${anime.title}"/>
    <br><br>
    <label for="type"><b>Enter type: </b></label>
    <input type="text" name="type" value="${anime.type}"/>
    <br><br>
    <label for="episodes"><b>Enter episodes: </b></label>
    <input type="number" name="episodes" value="${anime.episodes}"/>
    <br><br>
    <label for="status"> <b>Enter status: </b></label>
    <input type="text" name="status" value="${anime.status}"/>
    <br><br>
    <label for=" genre"><b>Enter genre: </b></label>
    <input type="text" name="genre" value="${anime.genre}"/>
    <br><br>
    <label for=" studio"><b>Enter studio: </b></label>
    <input type="text" name="studio" value="${anime.studio}"/>
    <br><br>
    <label for=" ageLimit"><b>Enter age limit: </b></label>
    <input type="text" name="ageLimit" value="${anime.ageLimit}"/>
    <br><br>
    <label for=" director"><b>Enter director: </b></label>
    <input type="text" name="director" value="${anime.director}"/>
    <br><br>
    <label for=" description"><b>Enter description: </b></label>
    <textarea name="description" style="width: 400px; height: 150px;">${anime.description}</textarea>
    <br><br>
    <label for=" file1"><b>Enter first photo: </b></label>
    <input type="file" name="file1" value="${file1}"/>
    <br><br>
    <label for="file2"><b>Enter second photo: </b></label>
    <input type="file" name="file2" value="${file2}"/>
    <br><br>
    <label for="file3"><b>Enter third photo: </b></label>
    <input type="file" name="file3" value="${file3}"/>
    <br><br>
    <label for="video"><b>Enter trailer url: </b></label>
    <input type="text" name="video" value="${url}"/>
    <br><br>
    <input class="submit" type="submit" value="Edit">
</form>
</body>
</html>