<?php
    require_once '../config.php';
    require_once '../functions.php';

    // Get the current race
    $race = getRace();
    $track = getTrack($race['idTrack']);
    $meteo = getMeteo($race['idMeteo']);
    $lap = 0;

    $sql = "SELECT lap FROM race_results WHERE idRace = " . $race['idRace'] . " AND session = 'Sprint' ORDER BY lap DESC LIMIT 1";
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result) > 0) 
        $lap = mysqli_fetch_assoc($result)['lap'];

    // if it is the start
    if($race['status'] == 'Sprint_Start') {
        // For the qualifying two riders
        $sql = "SELECT * FROM rider 
        INNER JOIN Team ON rider.idTeam = team.idTeam 
        INNER JOIN qualifying ON rider.idRider = qualifying.idRider
        WHERE idCategory = 1
        AND qualifying.idRace = " . $race['idRace'] . "
        AND qualifying.session = 'Qualifying_Two' 
        ORDER BY qualifying.position ASC";
        $result = mysqli_query($conn, $sql);
        if(!$result)
            die("Error: " . mysqli_error($conn));
        $increment = 0;
        // Generate lap times
        while($rider = mysqli_fetch_assoc($result)){
            $sql = "INSERT INTO race_results (idRider, idRace, session, total_time, lap, DNF)
                VALUES (" . $rider['idRider'] . ", " . $race['idRace'] . ", 'Sprint', " . $increment . ", 0, 0)";
            $insert = mysqli_query($conn, $sql);
            if(!$insert)
                die("Error: " . mysqli_error($conn));
            $increment += 200;
        }

        // For the qualifying one riders
        $sql = "SELECT * FROM rider 
        INNER JOIN Team ON rider.idTeam = team.idTeam 
        INNER JOIN qualifying ON rider.idRider = qualifying.idRider
        WHERE idCategory = 1
        AND qualifying.idRace = " . $race['idRace'] . "
        AND qualifying.session = 'Qualifying_One'
        AND rider.idRider NOT IN (SELECT idRider FROM qualifying WHERE idRace = " . $race['idRace'] . " AND session = 'Qualifying_Two')
        ORDER BY qualifying.position ASC";
        $result = mysqli_query($conn, $sql);
        if(!$result)
            die("Error: " . mysqli_error($conn));
        // Generate lap times
        while($rider = mysqli_fetch_assoc($result)){
            $sql = "INSERT INTO race_results (idRider, idRace, session, total_time, lap, DNF)
                VALUES (" . $rider['idRider'] . ", " . $race['idRace'] . ", 'Sprint', " . $increment . ", 0, 0)";
            $insert = mysqli_query($conn, $sql);
            if(!$insert)
                die("Error: " . mysqli_error($conn));
            $increment += 200;
        }

        // Update race status
        $sql = "UPDATE Race SET status = 'Sprint_Lap_" . $lap . "' WHERE idRace = " . $race['idRace'];
        $update = mysqli_query($conn, $sql);
        if(!$update)
            die("Error: " . mysqli_error($conn));
    } elseif(strpos($race['status'], 'Sprint_Lap') !== false OR $race['status'] == 'Sprint_End'){
        // Get the current lap
        if(strpos($race['status'], 'Start') !== false) {
            $lap = 0;
        } elseif(strpos($race['status'], 'End') !== false) {
            $lap = round($track['race_distance']/2) - 1;
        }else {
            $lap = explode("_", $race['status'])[2];
        }
        $lap++;
        

        // Get every rider
        $sql = "SELECT 
            rider.name AS rider_name, 
            team.name AS team_name, 
            rider.race_performance, 
            team.performance, 
            rider.wet_performance, 
            rider.crash_possibility, 
            race_results.total_time,
            race_results.idRider
        FROM rider
        INNER JOIN team ON rider.idTeam = team.idTeam
        INNER JOIN race_results ON rider.idRider = race_results.idRider
        WHERE idRace = " . $race['idRace'] . " 
        AND session = 'Sprint'
        AND idCategory = 1
        AND lap = " . ($lap-1) . " 
        AND DNF = 0
        ORDER BY race_results.position ASC";


        $result = mysqli_query($conn, $sql);
        if(!$result)
            die("Error: " . mysqli_error($conn));

        // Generate lap times
        echo "<div style='position: absolute; top: 0; left: 300px; margin: 10px; display: flex; flex-direction: column; height: fit-content; padding: 0;'>";
        while($rider = mysqli_fetch_assoc($result)){
            $DNF = 0;
            if($meteo['name'] == 'Sunny')
                $difference = (rand(150, 200) * (($rider['race_performance'] + $rider['performance'])/4));
            elseif($meteo['name'] == 'Light Rain')
                $difference = (rand(150, 200) * (($rider['race_performance'] + $rider['performance'] + $rider['wet_performance']/0.5)/5));
            elseif($meteo['name'] == 'Heavy Rain')
                $difference = (rand(150, 200) * (($rider['race_performance'] + $rider['performance'] + $rider['wet_performance'])/6));
            $difference = round($difference, 0);
            $lap_time = $track['lap_time'] + round($track['lap_time'] * $meteo['percentage_difference']/100, 0) + $difference;

            // Crash chance
            $crash1 = rand(0, 100);
            $crash2 = rand(0, 100);
            $mistake1 = rand(0, 75);
            $mistake2 = rand(0, 75);
            if($crash1 < $rider['crash_possibility']/2 AND $crash2 < $rider['crash_possibility']/2) {
                $DNF = 1;
                $lap_time = 0;
                echo "<label style='color: red; margin-right: 10px;'>" . $rider['rider_name'] . " crashNum " . $crash1 . " has crashed!</label>";
            } elseif($mistake1 < $rider['crash_possibility']/2 AND $mistake2 < $rider['crash_possibility']/2) {
                $lap_time += rand(1000, 5000);
                echo "<label style='color: yellow; margin-right: 10px;'>" . $rider['rider_name'] . " mistakeNum " . $mistake1 . " has made a mistake!</label>";
            }
        
            // Insert the lap time
            $sql = "INSERT INTO race_results (idRider, idRace, session, total_time, lap, DNF) 
                    VALUES (" . $rider['idRider'] . ", " . $race['idRace'] . ", 'Sprint', " . ($rider['total_time'] + $lap_time) . ", " . $lap . ", " . $DNF . ")";
            $insert = mysqli_query($conn, $sql);
            if(!$insert)
                die("Error: " . mysqli_error($conn));
        }
        // Update race status
        echo "</div>";
        if($lap == round($track['race_distance']/2)-1) {
            $sql = "UPDATE Race SET status = 'Sprint_End' WHERE idRace = " . $race['idRace'];
        } elseif($race['status'] == 'Sprint_End'){
            $sql = "UPDATE Race SET status = 'Race_Start' WHERE idRace = " . $race['idRace'];
        } else {
            $sql = "UPDATE Race SET status = 'Sprint_Lap_" . $lap . "' WHERE idRace = " . $race['idRace'];
        }
        $update = mysqli_query($conn, $sql);
        if(!$update)
            die("Error: " . mysqli_error($conn));   
    }