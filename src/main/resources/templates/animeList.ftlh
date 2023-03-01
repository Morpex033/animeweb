<!DOCTYPE html>
<html>
<head>
    <title>Anime</title>
</head>
<body>
<h1>Anime | <a href="/login">Login</a> </h1>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Logout">
</form>
<hr/>
<form action="/anime" method="get">
    Search by title: <input type="text" name="title"><br>
    <input type="submit" value="Search">
</form>
<#list anime as anime>
    <div>
        <a href="/anime/${anime.title}-${anime.id}"><p><b>${anime.title}</b></p></a>
    </div>
</#list>
<hr/>
<a href="/anime/create"><h3>Add new anime</h3></a>
</body>
</html>