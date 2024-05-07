<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Riders</title>
    <style>
        form {
            max-width: 400px;
            margin: 0;
            padding: 20px;
            background-color: #555555;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .filter {
            display: block;
            margin-bottom: 5px;
            color: #000000;
            font-family: "MotoGP Regular", sans-serif;
        }

        select {
            font-family: "MotoGP Regular", sans-serif;
            width: 100%;
            padding: 3px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        @font-face {
            font-family: 'MotoGP Bold';
            src: url('../fonts/MotoGP_Bold.ttf') format('truetype');;
        }

        @font-face {
            font-family: 'MotoGP Light';
            src: url('../fonts/MotoGP_Light.ttf') format('truetype');;
        }

        @font-face {
            font-family: 'MotoGP Regular';
            src: url('../fonts/MotoGP_Regular.ttf') format('truetype');;
        }

        body {
            background-color: #444444;
            font-family: 'MotoGP Bold', sans-serif;
            display: flex;
            flex-wrap: wrap;	
            align-items: flex-start;
            min-height: 100vh;
            margin: 70px;   
        }

        div{
            background-color: #111111;
            border-radius: 0px;
            padding: 5px;
            margin: 0px 0; 
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 20px; 
        }

        div.riderNumber {
            padding: 2px;
            margin-top: 10px;
            margin-bottom: 9px;
            margin-right: 10px; 
            margin-left: 10px;
            width: 25px;
            height: 15px;
        }

        label.riderNumber {
            font-size: 18px;
            width: 100%;
            text-align: center;
            padding-right: 3px;
            margin: 0;
            color: #ffffff;
            font-style: oblique;
            margin-bottom: 3px;
        }

        div label {
            color: #ffffff;
            font-size: 20px;
            margin-left: 10px;
        }

        div.position {
            padding: 0;
            margin: 10px;
            margin-left: 0; 
            margin-right: 10px;
            background-color: #111111;   
            width: 15px;
        }

        label.position {
            font-family: 'MotoGP Light', sans-serif;
            color: #ffffff;
            font-size: 20px;
            width: 100%;
            margin: 0;
            text-align: right;
        }

        div.whiteSpace {
            background-color: #ffffff;
            border-radius: 0;
            padding: 0;
            margin-left: 30px;
            width: 3.5px;
            height: 50px;
        }

        label.session{
            color: #ffffff;
            font-size: 40px;
            margin-top: -5px;
            margin-bottom: 10px;
            margin-left: 10px;
        }

        div.coloredSpace {
            border-radius: 0;
            width: 3.5px;
            background-color: #fefefe;
            padding-left: 0;
            padding-right: 0;
            margin: 0;
        }

        label.riderName {
            color: #ffffff;
            font-size: 20px;
            width: 200px;
            text-align: left;
        }

        div.distance {
            border-radius: 0;
            padding: -5px;
            margin: 10px;
            margin-right: -5px;
            margin-left: 0;
            background-color: #333333;   
            width: 80px;
            height: 100%;
        }

        label.distance {
            font-family: 'MotoGP Regular', sans-serif;
            color: #ffffff;
            font-size: 20px;
            width: 100%;
            margin: 0;
            text-align: right;
        }
        
        .button-container {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            background-color: transparent;
            position: absolute;
            top: 0;
            right: 0;
            margin: 10px;
        }

        .trackInfo {
            font-family: 'MotoGP Bold', sans-serif;
            position: absolute;
            bottom: 50px;
            right: 110px;
            margin: 10px;
            background-color: transparent;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .whiteLine {
            background-color: #ffffff;
            width: 1px;
            height: 65px;
            position: absolute;
            bottom: 11px;
            padding: 0;
            right: 115px;
        }

        .logo {
            background-color: transparent;
            position: absolute;
            bottom: 0;
            right: 5px;
            height: 55px;
            bottom: 16px;
            padding: 0;
        }

        .nationalFlag {
            background-color: #333333;
            padding: 0;
            margin-top: 10px;
            margin-bottom: 9px;
            margin-left: 10px;
            margin-right: 10px;
            height: 15px;
        }

        input[type="text"] {
            font-family: "MotoGP Bold", sans-serif;
            font-size: 16px;
            padding: 0;
            margin: 0;
            color: #ffffff;
            background-color: #555555;
            border: 0;
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


        div.riderOut {
            background-color: #1a1a1a;
            margin-left: -70px;
        }

        div.blackSpace {
            background-color: #1a1a1a;
            width: 16.5px;
        }

        div.outBox {
            background-color: #1a1a1a;
            margin-left: 5px;
            width: 50px;
            align-items: center;
        }
    </style>
</head>
<body>
    
    <?php
        if(isset($_GET['category'])) {
            require_once '../config.php';
            require_once '../functions.php';

            $sql = "SELECT * FROM team WHERE idCategory = " . $_GET['category'] . " ORDER BY performance ASC";
            $result = mysqli_query($conn, $sql);
            if(!$result)
                die("Error: " . mysqli_error($conn));
            while ($row = mysqli_fetch_assoc($result)) {
                
                echo "<div style='display: flex; flex-direction: column; height: 100%; background-color: transparent; padding: 0; width: 500px; height: 300px'>";
                echo '<form class="editForm" action="editTeam.php" method="post" style="display: none;">';
                echo '<input type="hidden" name="idTeam" value="' . $row['idTeam'] . '">';
                echo '</form>';
                echo "<h1 class='teamName' style='color:#" . $row['color'] . "'>" . $row['name'] . " - " . $row['performance'] . "</h1>";

                $sql2 = "SELECT * FROM rider WHERE idTeam = " . $row['idTeam'];
                $result2 = mysqli_query($conn, $sql2);
                if(!$result2)
                    die("Error: " . mysqli_error($conn));
                echo "<div style='display: flex; flex-direction: row; height: 100%; background-color: transparent; padding: 0;'>";
                while ($row2 = mysqli_fetch_assoc($result2)) {
                    echo "<form action='editRider.php' method='post'>";
                    echo "<input type='hidden' name='idRider' value='" . $row2['idRider'] . "' class='filter'>";
                    echo "<input type='text' name='name' value='" . $row2['name'] . "'class='filter'>";
                    echo "<input type='text' name='surname' value='" . $row2['surname'] . "'class='filter'>";
                    echo "<input type='submit' value='Edit'>";
                    echo "</form>";
                }
                echo "</div>";
                echo "</div>";
            } 
        } else {
            echo '<form action="editRiders.php">
                <label for="category" class="filter" class="filter" style= "color: #ffffff;">Category</label>
                <select name="category" id="category" required>
                    <option value="3">Moto3</option>
                    <option value="2">Moto2</option>
                    <option value="1">MotoGP</option>
                    <option value="4">No Team</option>
                </select>
                <input type="submit" value="Submit">
            </form>';
        }

        echo "<div class='button-container'>
                <button class='button-54' onclick='location.reload()'>Refresh</button>
                <button class='button-54' onclick='reset()'>Reset</button>
                <button class='button-54' onclick='location.href=\"../insert/insertRider.php\"'>New Rider</button>
                <button class='button-54' onclick='location.href=\"../insert/insertTeam.php\"'>New Team</button>
                <button class='button-54' onclick='location.href=\"editRiders.php\"'>Back</button>
                <button class='button-54' onclick='nextSeason();'>Next</button>
            </div>";
    ?>
    <script>
        function reset() {
            fetch('../reset.php')
            .then(response => response.text())
            .then(data => console.log(data));
        }

        function nextSeason() {
            fetch('../nextSeason.php')
            .then(response => response.text())
            .then(data => console.log(data));
            location.href="../index.php";
        }

        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.teamName').forEach(function(element) {
                element.addEventListener('click', function() {
                    element.previousElementSibling.submit();
                });
            });
        });



    </script>
    
</body>
</html>
