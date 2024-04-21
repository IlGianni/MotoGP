<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Race</title>
</head>
<body>
    <style>
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
            flex-direction: column;
            align-items: flex-start;
            justify-content: space-between;
            min-height: 100vh;
            margin-top: 0;
            margin-left: 70px;
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
            width: 55px;
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

        div.meteo {
            background-color: #333333;
            position: absolute;
            top: 100px;
            left: 700px;
            padding: 5px;
            margin: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 120px;
            height: 110px;
        }

        label.meteo {
            padding: 5px;
            margin: 10px;
            position: absolute;
            top: 50px;
            left: 700px;
            color: #ffffff;
            font-size: 35px;
            width: 130px;   
            text-align: center; 
            margin: 0;
        }

        div.track {
            background-color: #333333;
            position: absolute;
            top: 100px;
            left: 900px;
            padding: 5px;
            margin: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 220px;
            height: 60px;
        }

        label.track {
            padding: 5px;
            margin: 10px;
            position: absolute;
            top: 50px;
            left: 900px;
            color: #ffffff;
            font-size: 35px;
            width: 230px;   
            text-align: center; 
            margin: 0;
        }

        .meteoImage {
            height: 70px;
            filter: invert(100%);
        }


        .meteoLabel {
            color: #ffffff;
            font-size: 20px;
            margin: 0;  
        }

    </style>
    <div class='whiteSpace'></div>

    <?php
        require_once '../config.php';
        require_once '../functions.php';
        $race = getRace();
        $track = getTrack($race['idTrack']);
        $category = getCategory(2);

        if($race['idMeteo'] == NULL) {
            $condition = 1;
            if(rand(0, 100) < $track['percentage_rain'])
                $condition = 2;
            elseif(rand(0, 100) < $track['percentage_rain'] * 1.25)
                $condition = 3;
            $sql = "UPDATE race SET idMeteo = '" . $condition . "' WHERE idRace = " . $race['idRace'];
            $result = mysqli_query($conn, $sql);
            if(!$result)
                die("Error: " . mysqli_error($conn));
            echo $condition;
        }

        // Get the riders
        if($race['status'] == 'Pre_Qualifying') {
            $truncate = "TRUNCATE TABLE race_results";
            $result = mysqli_query($conn, $truncate);
            if(!$result)
                die("Error: " . mysqli_error($conn));
            // Pre-Qualifying
            require_once '../simulate/qualifying/pre_qualifying/pre2.php';
            $sql = "SELECT rider.name, surname, number, color, lap_time, rider.idRider FROM rider 
                INNER JOIN team ON rider.idTeam = team.idTeam 
                INNER JOIN qualifying ON rider.idRider = qualifying.idRider 
                WHERE qualifying.idRace = " . $race['idRace'] . " 
                AND qualifying.session = 'Pre_Qualifying'
                AND team.idCategory = 2
                ORDER BY qualifying.lap_time ASC";

            // Label for session
            $session = 'Qualifying Pre';
            echo "<label class='session'>Pre Qualifying</label>";
        } elseif($race['status'] == 'Qualifying_One') {
            // Qualifying One
            require_once '../simulate/qualifying/qualifying_one/one2.php';
            $sql = "SELECT rider.name, surname, number, color, lap_time, rider.idRider FROM rider 
                INNER JOIN team ON rider.idTeam = team.idTeam 
                INNER JOIN qualifying ON rider.idRider = qualifying.idRider 
                WHERE qualifying.idRace = " . $race['idRace'] . 
                " AND qualifying.session = 'Qualifying_One'
                AND team.idCategory = 2
                ORDER BY qualifying.lap_time ASC";

            // Label for session
            $session = 'Qualifying One';
            echo "<label class='session'>Qualifying One</label>";
        } elseif($race['status'] == 'Qualifying_Two') {
            // Qualifying Two
            require_once '../simulate/qualifying/qualifying_two/two2.php';
            $sql = "SELECT rider.name, surname, number, color, lap_time, rider.idRider FROM rider 
                INNER JOIN team ON rider.idTeam = team.idTeam 
                INNER JOIN qualifying ON rider.idRider = qualifying.idRider 
                WHERE qualifying.idRace = " . $race['idRace'] . 
                " AND qualifying.session = 'Qualifying_Two'
                AND team.idCategory = 2
                ORDER BY qualifying.lap_time ASC";

            // Label for session
            $session = 'Qualifying Two';
            echo "<label class='session'>Qualifying Two</label>";
        } elseif(strpos($race['status'], 'Start') !== false) {
            // Sprint Start
            if(strpos($race['status'], 'Sprint') !== false) 
                require_once '../simulate/race/sprint/sprint2.php';
            else
                require_once '../simulate/race/full_race/race2.php';
            $sql = "SELECT rider.name, surname, number, color, total_time, rider.idRider FROM rider 
                INNER JOIN team ON rider.idTeam = team.idTeam 
                INNER JOIN race_results ON rider.idRider = race_results.idRider 
                WHERE race_results.idRace = " . $race['idRace'] . "
                AND race_results.session = '" . explode("_", $race['status'])[0] . "'
                AND team.idCategory = 2
                AND race_results.DNF = 0
                ORDER BY race_results.total_time ASC";

            // Label for session
            $session = explode("_", $race['status'])[0] . " Starting Grid";
            echo "<label class='session'>" . explode("_", $race['status'])[0] . " Starting Grid</label>";
        } elseif(strpos($race['status'], 'Lap') !== false) {
            // Sprint Lap
            if(strpos($race['status'], 'Sprint') !== false) 
                require_once '../simulate/race/sprint/sprint2.php';
            else
                require_once '../simulate/race/full_race/race2.php';
            $lap = explode("_", $race['status'])[2];
            $sql = "SELECT rider.name, surname, number, color, total_time, rider.idRider FROM rider 
                INNER JOIN team ON rider.idTeam = team.idTeam 
                INNER JOIN race_results ON rider.idRider = race_results.idRider 
                WHERE race_results.idRace = " . $race['idRace'] . "
                AND race_results.session = '" . explode("_", $race['status'])[0] . "'
                AND team.idCategory = 2
                AND race_results.lap = " . ($lap+1) . "
                AND race_results.DNF = 0
                ORDER BY race_results.total_time ASC";
            $crash = "SELECT rider.name, surname, number, color, total_time, rider.idRider FROM rider 
                INNER JOIN team ON rider.idTeam = team.idTeam
                INNER JOIN race_results ON rider.idRider = race_results.idRider
                WHERE race_results.idRace = " . $race['idRace'] . "
                AND race_results.session = '" . explode("_", $race['status'])[0] . "'
                AND team.idCategory = 2
                AND race_results.DNF = 1
                GROUP BY rider.idRider
                ORDER BY race_results.total_time DESC";
            
            // Label for session
            if(strpos($race['status'], 'Sprint_Lap') !== false) {
                if($lap == round($track['race_distance']*$category['percentage_race_distance']/100/2) - 2)
                    echo "<label class='session'>LAST LAP</label>";
                else    
                    echo "<label class='session'>LAP " . ($lap+1) . "</label>";
                $session = 'Sprint Lap';
            } else {
                if($lap == round($track['race_distance']*$category['percentage_race_distance']/100) - 2)
                    echo "<label class='session'>LAST LAP</label>";
                else    
                    echo "<label class='session'>LAP " . ($lap+1) . "</label>";
                $session = 'Race Lap';
            }
        } elseif(strpos($race['status'], 'End') !== false) {
            // End of Sprint
            if(strpos($race['status'], 'Sprint') !== false) {
                require_once '../simulate/race/sprint/sprin2.php';
                $lap = round($track['race_distance']*$category['percentage_race_distance']/100/2);
            } else {
                require_once '../simulate/race/full_race/race2.php';
                $lap = round($track['race_distance']*$category['percentage_race_distance']/100);
            }
            $sql = "SELECT rider.name, surname, number, color, total_time, rider.idRider FROM rider 
                INNER JOIN team ON rider.idTeam = team.idTeam 
                INNER JOIN race_results ON rider.idRider = race_results.idRider 
                WHERE race_results.idRace = " . $race['idRace'] . "
                AND race_results.session = '" . explode("_", $race['status'])[0] . "'
                AND team.idCategory = 2
                AND race_results.lap = " . $lap . "
                AND race_results.DNF = 0
                ORDER BY race_results.total_time ASC";
            $crash = "SELECT rider.name, surname, number, color, total_time, rider.idRider FROM rider 
                INNER JOIN team ON rider.idTeam = team.idTeam
                INNER JOIN race_results ON rider.idRider = race_results.idRider
                WHERE race_results.idRace = " . $race['idRace'] . "
                AND race_results.session = '" . explode("_", $race['status'])[0] . "'
                AND team.idCategory = 2
                AND race_results.DNF = 1
                GROUP BY rider.idRider
                ORDER BY race_results.total_time DESC";
            
            // Label for session
            $session = explode("_", $race['status'])[0] . " Results";
            echo "<label class='session'>" . explode("_", $race['status'])[0] . " Results</label>";
        } elseif (strpos($race['status'], 'Standings') !== false) {
            $sql = "SELECT rider.name, surname, number, color, standings.points, rider.idRider FROM rider 
                INNER JOIN team ON rider.idTeam = team.idTeam
                INNER JOIN Standings ON rider.idRider = Standings.idRider
                WHERE Standings.idSeason = " . $race['idSeason'] . " 
                AND Standings.idCategory = 2
                ORDER BY Standings.points DESC";    
                
            // Label for session
            $session = 'Standings';
            echo "<label class='session'>Standings</label>";
        } elseif(strpos($race['status'], 'Finished2') !== false) {
            $sql = "UPDATE Race SET status = 'Pre_Qualifying', category = 'MotoGP' WHERE idRace = " . $race['idRace'];
            $update = mysqli_query($conn, $sql);

            if(!$update) {
                die("Error: " . mysqli_error($conn));
            } else {
                // Redirect to motogp.php using JavaScript
                echo "<script>window.location.href='MotoGP.php';</script>";
                exit(); // Ensure that script stops executing after echoing JavaScript
            }
        }
        
        $result = mysqli_query($conn, $sql);
        if(!$result)
            die("Error: " . mysqli_error($conn));
        if(strpos($race['status'], 'Lap') !== false OR strpos($race['status'], 'End') !== false) {
            $result_crash = mysqli_query($conn, $crash);
            if(!$result_crash)
                die("Error: " . mysqli_error($conn));
        }

        
        echo "<div class='whiteSpace' style='height: 15px;'></div>";
        $position = 1;
        $previous = 0;
        $previous_points_standings = 0;
        while ($row = mysqli_fetch_assoc($result)) {
            // All'interno del tuo loop, quando imposti il colore di sfondo:
            if (isColorLight($row['color'])) {
                $textColor = 'black'; // Colore del testo per sfondi chiari
            } else {
                $textColor = 'white'; // Colore del testo per sfondi scuri
            }

            // Update the position
            if(strpos($race['status'], 'Lap') !== false) {
                $sql = "UPDATE race_results SET position = " . $position . " WHERE idRider = " . $row['idRider'] . " AND idRace = " . $race['idRace'] . " AND session = '" . explode("_", $race['status'])[0] . "' AND lap = " . $lap . " AND DNF = 0" ;
                $update = mysqli_query($conn, $sql);
                if(!$update)
                    die("Error: " . mysqli_error($conn));
            } elseif(strpos($race['status'], 'End') !== false) {
                $sql = "UPDATE race_results SET position = " . $position . " WHERE idRider = " . $row['idRider'] . " AND idRace = " . $race['idRace'] . " AND session = '" . explode("_", $race['status'])[0] . "' AND lap = " . $lap . " AND DNF = 0" ;
                $update = mysqli_query($conn, $sql);
                if(!$update)
                    die("Error: " . mysqli_error($conn));
                $sql = "SELECT race_results.position, points.points FROM race_results 
                    INNER JOIN rider ON rider.idRider = race_results.idRider
                    INNER JOIN team ON rider.idTeam = team.idTeam
                    INNER JOIN points ON race_results.position = points.position
                    WHERE rider.idRider = " . $row['idRider'] . " 
                    AND race_results.idRace = " . $race['idRace'] . "
                    AND race_results.session = '" . explode("_", $race['status'])[0] . "'
                    AND team.idCategory = 2
                    AND race_results.lap = " . $lap . "
                    AND race_results.DNF = 0";
                $result_position = mysqli_query($conn, $sql);
                if(!$result_position)
                    die("Error: " . mysqli_error($conn));
                $row_position = mysqli_fetch_assoc($result_position);
                $sql = "UPDATE race_results SET position = " . $row_position['position'] . ", points = " . $row_position['points'] . " WHERE idRider = " . $row['idRider'] . " AND idRace = " . $race['idRace'] . " AND session = '" . explode("_", $race['status'])[0] . "' AND lap = " . ($lap+1) . " AND DNF = 0" ;
                $update = mysqli_query($conn, $sql);
                if(!$update)
                    die("Error: " . mysqli_error($conn));
            } else if(strpos($race['status'], 'Qualifying') !== false) {
                $sql = "UPDATE qualifying SET position = " . $position . " WHERE idRider = " . $row['idRider'] . " AND idRace = " . $race['idRace'] . " AND session = '" . $race['status'] . "'";
                $update = mysqli_query($conn, $sql);
                if(!$update)
                    die("Error: " . mysqli_error($conn));
            }

            
            echo "<div class='riderBox'>
                <div class='position'>
                    <label class='position'>" . $position . "</label>
                </div>
                <div class='coloredSpace' style='background-color: #" . $row['color'] . "'></div>
                <label class='riderName'>" . substr($row['name'], 0, 1) . " " . substr(str_replace(' ', '', $row['surname']), 0, 3) . "</label>
                <div class='riderNumber' style='background-color: #" . $row['color'] . "'>
                    <label class='riderNumber' style='color: " . $textColor . ";'>" . $row['number'] . "</label>
                </div>";
                if(strpos($race['status'], 'End') !== false) {
                    $sql = "SELECT points.points FROM race_results 
                        INNER JOIN points ON race_results.position = points.position
                        INNER JOIN rider ON rider.idRider = race_results.idRider
                        INNER JOIN team ON rider.idTeam = team.idTeam
                        WHERE rider.idRider = " . $row['idRider'] . " 
                        AND race_results.idRace = " . $race['idRace'] . "
                        AND race_results.session = '" . explode("_", $race['status'])[0] . "'
                        AND team.idCategory = 2
                        AND points.session = '" . explode("_", $race['status'])[0] . "'
                        AND race_results.lap = " . $lap . "
                        AND race_results.DNF = 0";
                    $result_position = mysqli_query($conn, $sql);
                    if(!$result_position)
                        die("Error: " . mysqli_error($conn));
                    $row_position = mysqli_fetch_assoc($result_position);

                    $sql = "UPDATE Standings SET points = points + " . $row_position['points'] . " WHERE idRider = " . $row['idRider'] . " AND idCategory = 2 AND idSeason = " . $race['idSeason'];
                    $update = mysqli_query($conn, $sql);
                    if(!$update)
                        die("Error: " . mysqli_error($conn));
                }
                if(strpos($race['status'], 'Qualifying') !== false)
                    $time = $row['lap_time'];
                elseif (strpos($race['status'], 'Sprint') !== false OR strpos($race['status'], 'Race') !== false)
                    $time = $row['total_time'];
                elseif (strpos($race['status'], 'Standings') !== false)
                    $time = $row['points'];
                if($position == 1) {
                    echo "<div class='coloredSpace' style='background-color: #cc0000'></div>";
                    if(strpos($race['status'], 'End') !== false) {
                        $formatted_time = '+' . $row_position['points'];
                    } elseif(strpos($race['status'], 'Standings') !== false) {
                        $formatted_time = $row['points'];
                        $previous_points_standings = $row['points'];
                    } else {
                        $lap_time_in_milliseconds = $time;

                        // Converti i millisecondi in minuti, secondi e millisecondi
                        $minutes = floor($lap_time_in_milliseconds / (60 * 1000));
                        $seconds = floor(($lap_time_in_milliseconds - ($minutes * 60 * 1000)) / 1000);
                        $milliseconds = $lap_time_in_milliseconds % 1000;

                        // Formatta il tempo
                        $formatted_time = sprintf('%02d:%02d:%03d', $minutes, $seconds, $milliseconds);
                    }
                    echo "<div class='distance'>
                        <label class='distance'>" . $formatted_time . "</label>
                    </div>";
                } else {
                    echo "<div class='coloredSpace' style='background-color: #000000'></div>";
                    if(strpos($race['status'], 'End') !== false) {
                        echo "<div class='distance'>
                            <label class='distance'>+" . $row_position['points'] . "</label>
                        </div>";
                    } elseif(strpos($race['status'], 'Standings') !== false) {
                        echo "<div class='distance'>
                            <label class='distance'>-" . $previous_points_standings - $row['points'] . "</label>
                        </div>";
                    } else {
                        echo "<div class='distance'>
                            <label class='distance'>+" . number_format(($time - $previous)/1000, 3) . "</label>
                        </div>";
                    }
                }
                if($position == 1) 
                    $previous = $time;
            echo "</div>";
            $position++;
        }        
        if(strpos($race['status'], 'Lap') !== false OR strpos($race['status'], 'End') !== false) {
            $first = true;
            while($row = mysqli_fetch_assoc($result_crash)) {
                echo "<div class='riderOut'>
                    <div class='blackSpace'></div>
                    <div class='coloredSpace' style='background-color: #" . $row['color'] . "'></div>
                    <label class='riderName'>" . substr($row['name'], 0, 1) . " " . substr(str_replace(' ', '', $row['surname']), 0, 3) . "</label>
                    <div class='coloredSpace' style='background-color: #555555; margin-right: -5px;'></div>";
                    if($first) {
                        echo "<div class='outBox'>
                            <label style='color: #aaaaaa; font-size: 17.5px; margin-bottom: 2.5px; '>OUT</label>
                        </div>";
                        $first = false;
                    }
                echo "</div>";
            }
        }
        
        echo "<div class='whiteSpace' style='height: 100%; flex-grow: 1;'></div>";

        echo "<label class='meteo'>Meteo</label>";
        echo "<div class='meteo'>";
            if($race['idMeteo'] == 1) {
                echo "<img src='../images/Sunny.png' class='meteoImage'>";
                echo "<label class='meteoLabel'>Sunny</label>";
            } elseif($race['idMeteo'] == 2) {
                echo "<img src='../images/Light Rain.png' class='meteoImage'>";
                echo "<label class='meteoLabel'>Light Rain</label>";
            } else {
                echo "<img src='../images/Heavy Rain.png' class='meteoImage'>";
                echo "<label class='meteoLabel'>Heavy Rain</label>";
            }
        echo "</div>";

        echo "<label class='track'>Track</label>";
        echo "<div class='track'>";
            $lap_time = $track['lap_time'] + $track['lap_time'] * (100 - $category['lap_slower'])/100;
            $lap_time_in_milliseconds = $lap_time;

            // Converti i millisecondi in minuti, secondi e millisecondi
            $minutes = floor($lap_time_in_milliseconds / (60 * 1000));
            $seconds = floor(($lap_time_in_milliseconds - ($minutes * 60 * 1000)) / 1000);
            $milliseconds = $lap_time_in_milliseconds % 1000;

            // Formatta il tempo
            $formatted_time = sprintf('%02d:%02d:%03d', $minutes, $seconds, $milliseconds);
            echo "<label class='meteoLabel'>Record: " . $formatted_time . "</label>";
            echo "<label class='meteoLabel'>Rain possibility: " . $track['percentage_rain'] . "%</label>";
        echo "</div>";
        
        echo "<div class='button-container'>
            <button class='button-54' onclick='location.reload()'>Refresh</button>
            <button class='button-54' onclick='reset()'>Reset</button>
            <button class='button-54' onclick='location.href=\"../index.php\"'>Home</button>
        </div>";

        echo "<div class='trackInfo'>
                <label>#" . $track['name'] . "</label>";
                if(strpos($race['status'], 'Lap') !== false) {
                    $lap = explode("_", $race['status'])[2];
                    if(strpos($race['status'], 'Sprint') !== false)
                        echo "<label>LAP " . ($lap+2) . " OF " . round($track['race_distance']*$category['percentage_race_distance']/100/2) . "</label>";
                    else
                        echo "<label>LAP " . ($lap+2) . " OF " . round($track['race_distance']*$category['percentage_race_distance']/100) . "</label>";
                    echo "<label>" . $category['name'] . " " . explode(" ", $session)[0] . "</label><br>";
                } else {
                    echo "<label>" . $category['name'] . "</label> 
                        <label>" . explode(" ", $session)[0] . "</label>";
                }
            echo "</div>
            <div class='whiteLine'></div>
            <img src='../images/MotoGp_Logo.png' class='logo'>";

        if(strpos($race['status'], 'Standings') !== false) {
            $sql = "UPDATE Race SET status = 'Finished2' WHERE idRace = " . $race['idRace'];
            $update = mysqli_query($conn, $sql);
            if(!$update)
                die("Error: " . mysqli_error($conn));
        } 
            

    ?>
    <script>
        function reset() {
            fetch('../reset.php')
            .then(response => response.text())
            .then(data => console.log(data));
        }
        
    </script>
</body>
</html>