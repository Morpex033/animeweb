<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${anime.title}</title>
    <#import "scripts/scripts.ftlh" as script>
    <#import "styles/css.ftlh" as style>
    <@style.anime></@style.anime>
</head>
<body>
<div class="body">
    <a href="/anime"><input class="submit" type="submit" value="Home page"></a>
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
            <iframe width="355" height="200" src="${video}" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    allowfullscreen></iframe>
        </div>
    </div>

    <#if user.isAdmin()>
        <hr/>
        <a href="/anime/edit/${anime.title}-${anime.id}"><input class="submit" type="submit" value="Edit"></a>
        <br>
        <br>
        <form action="/anime/delete/${anime.title}-${id}" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input class="submit" type="submit" value="Delete">
        </form>
    </#if>
</div>
</body>
</html>