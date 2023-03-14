<#macro index>
    <link rel="stylesheet" type="text/css">
    <style>
        a {
            text-decoration: none;
        }

        p {
            margin: unset;
        }

        .anime-block {
            display: inline-flex;
            padding: 5px;
        }

        .anime-img {
            display: inline-block;
            padding: 5px;
            height: 150px;
        }

        .info-block {
            display: table;
            padding: 5px;
            width: 750px;
            height: 50px;
        }

        .title {
            display: table-row;
            font-size: x-large;
        }

        .genre {
            display: table-row;
            font-size: large;
        }

        .description {
            display: table-row;
        }
    </style>
</#macro>

<#macro anime>
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
</#macro>