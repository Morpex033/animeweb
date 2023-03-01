<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${anime.title}</title>
</head>
<body>
<#list images as img>
    <img src="/images/${img.id}" height="60px"/><br><br>
</#list>
<b>Title: </b>${anime.title}
<br>
<br>
<b>Type: </b>${anime.type}
<br>
<br>
<b>Episodes: </b>${anime.episodes}
<br>
<br>
<b>Status: </b>${anime.status}
<br>
<br>
<b>Genre: </b>${anime.genre}
<br>
<br>
<b>Studio: </b>${anime.studio}
<br>
<br>
<b>Age limit: </b>${anime.ageLimit}
<br>
<br>
<b>Director: </b>${anime.director}
<br>
<br>
<b>Description: </b>${anime.description}
<hr/>
<form action="/anime/delete/${anime.title}-${id}" method="post">
    <input type="submit" value="Delete">
</form>
</body>
</html>