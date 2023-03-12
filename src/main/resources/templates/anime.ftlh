<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${anime.title}</title>
    <link rel="stylesheet" type="text/css">
    <style>
        .body {
            display: inline-block;
        }

        .img-and-info {
            display: table;
            padding: 10px;
        }

        .img-preview {
            display: inline-block;
            padding: 5px;
        }

        .info-block {
            display: inline-block;
            padding: 15px;
            vertical-align: 35px;
        }

        .info-row {
            display: table-row;
        }

        .img-video-line {
            display: inline-block;
            padding: 10px;
        }
    </style>
</head>
<body>
<div class="body">
    <a href="/anime"><input type="submit" value="Home page"></a>
    <hr>
    <br>
    <div>
        <div class="img-and-info">
            <div class="img-preview">
                <#list images as img>
                    <#if img.isPreviewImage??>
                        <img src="/images/${img.id}" height="300px"/>
                    </#if>
                </#list>
            </div>
            <div class="info-block">
                <div class="info-row"><b>Title: </b>${anime.title}</div>
                <br>
                <div class="info-row"><b>Type: </b>${anime.type}</div>
                <br>
                <div class="info-row"><b>Episodes: </b>${anime.episodes}</div>
                <br>
                <div class="info-row"><b>Status: </b>${anime.status}</div>
                <br>
                <div class="info-row"><b>Genre: </b>${anime.genre}</div>
                <br>
                <div class="info-row"><b>Studio: </b>${anime.studio}</div>
                <br>
                <div class="info-row"><b>Age limit: </b>${anime.ageLimit}</div>
                <br>
                <div class="info-row"><b>Director: </b>${anime.director}</div>
            </div>
        </div>
        <div><b>Description: </b>${anime.description}</div>
        <div class="img-video-line">
            <#list images as img>
                <#if img.isPreviewImage??>
                <#else>
                    <img src="/images/${img.id}" height="200px"/>
                </#if>
            </#list>
            <iframe width="355" height="200" src="${video}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
        </div>
    </div>
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
</div>
</body>
</html>