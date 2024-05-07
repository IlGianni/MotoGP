<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Standings</title>
</head>
<body>
    <style>
        @font-face {
            font-family: 'MotoGP Bold';
            src: url('../../fonts/MotoGP_Bold.ttf') format('truetype');;
        }

        @font-face {
            font-family: 'MotoGP Light';
            src: url('../../fonts/MotoGP_Light.ttf') format('truetype');;
        }

        @font-face {
            font-family: 'MotoGP Regular';
            src: url('../../fonts/MotoGP_Regular.ttf') format('truetype');;
        }

        body {
            background-color: #444444;
            font-family: 'MotoGP Bold', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: space-between;
            min-height: 100vh;
            margin-top: 0;
            margin-left: 70px;
            overflow: hidden;
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
            width: 300px;
            text-align: left;
        }

        div.distance {
            border-radius: 0;
            padding: -5px;
            margin: 10px;
            margin-right: -5px;
            margin-left: 0;
            background-color: #333333;   
            width: 60px;
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

    <?php
        require_once '../../config.php';
        require_once '../../functions.php';

        $race = getRace();
        $track = getTrack($race['idTrack']);
        
        $sql = "SELECT * FROM season ORDER BY year DESC";
        $result = mysqli_query($conn, $sql);
        $seasons = mysqli_fetch_all($result, MYSQLI_ASSOC);

        echo "<div class='whiteSpace'></div>";
            echo "<label class='session'>" . $track['name'] . "</label>";
            echo "<div class='whiteSpace' style='height: 15px;'></div>";

        
        $category = getCategory(1);

        if(isset($_GET['category']) AND isset($_GET['season'])){
            $category = $_GET['category'];
            $season = $_GET['season'];
            $sql = "SELECT team.name, team.color, SUM(standings.points) AS total_points, team.nation FROM standings 
                INNER JOIN rider ON rider.idRider = standings.idRider
                INNER JOIN team ON team.idTeam = rider.idTeam
                INNER JOIN category ON category.idCategory = standings.idCategory
                WHERE standings.idCategory = " . $category . " AND idSeason = " . $season . " 
                GROUP BY team.name, team.color
                ORDER BY total_points DESC";
            $result = mysqli_query($conn, $sql);
            if(!$result){
                echo "Error: " . mysqli_error($conn);
            }
            $position = 1;
            $category = getCategory($_GET['category']);
            

            $firstPoints = 0;
            while($row = mysqli_fetch_assoc($result)){
                // All'interno del tuo loop, quando imposti il colore di sfondo:
                if (isColorLight($row['color'])) {
                    $textColor = 'black'; // Colore del testo per sfondi chiari
                } else {
                    $textColor = 'white'; // Colore del testo per sfondi scuri
                }

                echo "<div class='riderBox'>
                <div class='position'>
                    <label class='position'>" . $position . "</label>
                </div>
                <div class='coloredSpace' style='background-color: #" . $row['color'] . "'></div>
                <label class='riderName'>" . $row['name'] . "</label>";
                if($position == 1){
                    echo "<div class='coloredSpace' style='background-color: #cc0000'></div>";
                    $firstPoints = $row['total_points'];
                } else {
                    echo "<div class='coloredSpace' style='background-color: #000000'></div>";
                }
                echo "<div class='distance'>
                        <label class='distance' style='margin-right: 10px;'>" . $row['total_points'] . "</label>
                    </div>";
                echo "<div class='coloredSpace' style='background-color: #" . $row['color'] . "; margin: 0; margin: 0; height: 20px; padding: 0; width: 1px;'></div>";
                if($position == 1){
                    echo "<div class='distance'>
                        <label class='distance'>Leader</label>
                    </div>";
                } else {
                    echo "<div class='distance'>
                        <label class='distance'>-" . $firstPoints - $row['total_points'] . "</label>
                    </div>";
                }
                echo "<div class='distance' style='width: 40px;'>
                    <img src='../../images/" . $row['nation'] . ".svg' alt='flag' class='nationalFlag'>
                </div>";
                echo "</div>";
                
                $position++;
            }
            
        } else {
            echo '
                <style>
                    /* Stile per il form */
                    form {
                        max-width: 400px;
                        margin: 0;
                        padding: 20px;
                        background-color: transparent;
                        border-radius: 8px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }

                    .filter {
                        display: block;
                        margin-bottom: 5px;
                        color: #ffffff;
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
                </style>

                <form action="standingsTeam.php">
                    <label for="category" class="filter">Category</label>
                    <select name="category" id="category" required>
                        <option value="3">Moto3</option>
                        <option value="2">Moto2</option>
                        <option value="1">MotoGP</option>
                    </select>

                    <label for="season" class="filter">Season</label>
                    <select name="season" id="season" required>';
                        foreach($seasons as $season) {
                            echo "<option value='" . $season['idSeason'] . "'>" . $season['year'] . "</option>";
                        }
                echo '    
                    </select>

                    <input type="submit" value="Submit" style="box-sizing: border-box; width: 100%; margin-left: -3px;">
                </form>';

        }

        echo "<div class='whiteSpace' style='height: 100%; flex-grow: 1;'></div>";
        echo "<div class='button-container'>
                <button class='button-54' onclick='location.reload()'>Refresh</button>
                <button class='button-54' onclick='reset()'>Reset</button>
                <button class='button-54' onclick='location.href=\"standings.php\"'>Rider Standings</button>
                <button class='button-54' onclick='location.href=\"standingsTeam.php\"'>Back</button>
                <button class='button-54' onclick='location.href=\"../Moto3.php\"'>Next</button>
                <button class='button-54' onclick='location.href=\"../../index.php\"'>Home</button>
            </div>";

        echo "<div class='trackInfo'>
                <label>#" . $track['name'] . "</label>";
                echo "<label>" . $category['name'] . "</label> 
                <label>Standings</label>";
            echo "</div>
            <div class='whiteLine'></div>
            <img src='../../images/MotoGp_Logo.png' class='logo'>";
    ?>
</body>
</html>