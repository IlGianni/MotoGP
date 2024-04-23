<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <style>

        @font-face {
            font-family: 'MotoGP Bold';
            src: url('fonts/MotoGP_Bold.ttf') format('truetype');;
        }

        @font-face {
            font-family: 'MotoGP Light';
            src: url('fonts/MotoGP_Light.ttf') format('truetype');;
        }

        @font-face {
            font-family: 'MotoGP Regular';
            src: url('fonts/MotoGP_Regular.ttf') format('truetype');;
        }

        body {
            background-color: #444444;
            font-family: 'MotoGP Bold', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: space-between;
            margin-top: 0;
            margin-left: 70px;
            overflow: hidden;
        }

        .button-54, input[type="submit"] {
            font-family: "MotoGP Bold", sans-serif;
            margin: 5px;
            font-size: 16px;
            letter-spacing: 2px;
            text-decoration: none;
            text-transform: uppercase;
            color: #000;
            cursor: pointer;
            border: 3px solid;
            padding: 0.25em 0.5em;
            box-shadow: 1px 1px 0px 0px, 2px 2px 0px 0px, 3px 3px 0px 0px, 4px 4px 0px 0px, 5px 5px 0px 0px;
            position: relative;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
        }

        .button-54:active, input[type="submit"]:active {
            box-shadow: 0px 0px 0px 0px;
            top: 5px;
            left: 5px;
        }

        a {
            text-decoration: none;
            color: black;
        }
    </style>
    <button class="button-54"><a href="show/standings/standings.php">Standings</a></button>
    <?php
        require_once 'config.php';
        require_once 'functions.php';

        $race = getRace();
        echo '<button class="button-54"><a href="show/' . $race['category'] . '.php">Race</a></button>';
    ?>
    <button class="button-54"><a href="edit/editRiders.php">Riders Market</a></button>
    <button class="button-54"><a href="exportData.php">Export Data</a></button>
</body>
</html>