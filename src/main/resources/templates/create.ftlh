<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Create</title>
</head>
<body>
<form method="post" action="/anime/create" enctype="multipart/form-data">
    <label for="title"><b>Enter title: </b></label>
    <input type="text" name="title"/>
    <br><br>
    <label for="type"><b>Enter type: </b></label>
    <input type="text" name="type"/>
    <br><br>
    <label for="episodes"><b>Enter episodes: </b></label>
    <input type="number" name="episodes"/>
    <br><br>
    <label for="status"><b>Enter status: </b></label>
    <input type="text" name="status"/>
    <br><br>
    <label for="genre"><b>Enter genre: </b></label>
    <input type="text" name="genre"/>
    <br><br>
    <label for="Studio"><b>Enter Studio: </b></label>
    <input type="text" name="Studio"/>
    <br><br>
    <label for="ageLimit"><b>Enter age limit: </b></label>
    <input type="text" name="ageLimit"/>
    <br><br>
    <label for="director"><b>Enter director: </b></label>
    <input type="text" name="director"/>
    <br><br>
    <label for="description"><b>Enter description: </b></label>
    <input type="text" name="description"/>
    <br><br>
    <label for="file1"><b>Enter first photo: </b></label>
    <input type="file" name="file1"/>
    <br><br>
    <label for="file2"><b>Enter second photo: </b></label>
    <input type="file" name="file2"/>
    <br><br>
    <label for="file3"><b>Enter third photo: </b></label>
    <input type="file" name="file3"/>
    <br><br>
    <input type="submit" value="Create">
</form>
</body>
</html>