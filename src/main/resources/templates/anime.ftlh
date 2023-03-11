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
<a href="/anime"><input type="submit" value="Home page"></a>
<hr>
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
<#if user.isAdmin()>
<hr/>
<a href="/anime/edit/${anime.title}-${anime.id}"><input type="submit" value="Edit"></a>
<br>
<br>
<form action="/anime/delete/${anime.title}-${id}" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Delete">
</form>
</#if>
</body>
</html>