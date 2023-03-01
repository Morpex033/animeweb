<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
</head>
<body>
<h1>ANIME</h1>
<hr>
<h4>Login</h4>
<form action="/login" method="post">
    <b>Email: </b><input type="email" name="username"><br><br>
    <b>Password: </b> <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Login"/>
</form>
<a href="/registration">Registration</a>
</body>
</html>