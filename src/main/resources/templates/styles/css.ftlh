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

        .search {
            padding: 10px;
            border-radius: 5px;
            border: none;
            outline: none;
            font-size: 16px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 300px;
        }

        .search::placeholder{
            color: gray;
        }

        .submit {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-left: 10px;
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

        .submit {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-left: 10px;
        }
    </style>
</#macro>