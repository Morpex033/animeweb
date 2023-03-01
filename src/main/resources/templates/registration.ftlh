<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Registration</title>
</head>
<body>
<h1>ANIME</h1><hr>
<h2>Registration</h2>
<form action="/registration" method="post">
    <b>User name: </b> <input type="text" name="name"><br><br>
    <b>Email: </b> <input type="email" name="email"><br><br>
    <b>Phone number: </b> <input type="text" name="numberPhone"><br><br>
    <b>Password: </b> <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Registration"/>
</form>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>