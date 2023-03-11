<!DOCTYPE html>
<html>
<head>
    <title>Anime</title>
</head>
<body>
<h1>Anime </h1>
<hr>
<#if user.email??>
    <h3>Hello, ${user.name}</h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Logout">
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Admin panel</a>
    </#if>
<#else>
    <h2><a href="/login">Login</a></h2>
</#if>
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
<#if user.email??>
    <#if user.isAdmin()>
        <hr/>
        <a href="/anime/create"><input type="submit" value="Add new anime"></a>
    </#if>
</#if>
</body>
</html>