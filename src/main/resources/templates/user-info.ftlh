<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${user.name}</title>
</head>
<body>
<h1>ANIME</h1>
<hr>
<h3>${user.name} personal data</h3>
<br><br>
<h4>Email: ${user.email}</h4>
<h4>Phone number: ${user.numberPhone}</h4>
<h4>Active: ${user.active?string('yes', 'no')}</h4>
<h4>Role: <#list user.roles as role>${role}</#list></h4>
<h4>Date of created: ${user.dateOfCreated}</h4>
</body>
</html>