<?php
    require_once '../config.php';
    require_once '../functions.php';

    // Get the current race
    $race = getRace();
    $track = getTrack($race['idTrack']);
    $meteo = getMeteo($race['idMeteo']);
    $category = getCategory(2);
    $lap = 0;

    $sql = "SELECT lap FROM race_results WHERE idRace = " . $race['idRace'] . " AND session = 'Race' ORDER BY lap DESC LIMIT 1";
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result) > 0) 
        $lap = mysqli_fetch_assoc($result)['lap'];

    // if it is the start
    if($race['status'] == 'Race_Start') {
        // For the qualifying two riders
        $sql = "SELECT * FROM rider 
        INNER JOIN Team ON rider.idTeam = team.idTeam 
        INNER JOIN qualifying ON rider.idRider = qualifying.idRider
        WHERE idCategory = 2
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
                VALUES (" . $rider['idRider'] . ", " . $race['idRace'] . ", 'Race', " . $increment . ", 0, 0)";
            $insert = mysqli_query($conn, $sql);
            if(!$insert)
                die("Error: " . mysqli_error($conn));
            $increment += 200;
        }

        // For the qualifying one riders
        $sql = "SELECT * FROM rider 
        INNER JOIN Team ON rider.idTeam = team.idTeam 
        INNER JOIN qualifying ON rider.idRider = qualifying.idRider
        WHERE idCategory = 2
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
                VALUES (" . $rider['idRider'] . ", " . $race['idRace'] . ", 'Race', " . $increment . ", 0, 0)";
            $insert = mysqli_query($conn, $sql);
            if(!$insert)
                die("Error: " . mysqli_error($conn));
            $increment += 200;
        }

        // Update race status
        $sql = "UPDATE Race SET status = 'Race_Lap_" . $lap . "' WHERE idRace = " . $race['idRace'];
        $update = mysqli_query($conn, $sql);
        if(!$update)
            die("Error: " . mysqli_error($conn));
    } elseif(strpos($race['status'], 'Race_Lap') !== false OR $race['status'] == 'Race_End'){
        // Get the current lap
        if(strpos($race['status'], 'Start') !== false) {
            $lap = 0;
        } elseif(strpos($race['status'], 'End') !== false) {
            $lap = round($track['race_distance']*$category['percentage_race_distance']/100) - 1;
        }else {
            $lap = explode("_", $race['status'])[2];
        }
        $lap++;
        

        // Get every rider
        $sql = "SELECT 
            rider.name AS rider_name, 
            rider.surname AS rider_surname,
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
        AND session = 'Race'
        AND idCategory = 2
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
                $difference = (rand(100, 200) * (($rider['race_performance'] + $rider['performance'])/4));
            elseif($meteo['name'] == 'Light Rain')
                $difference = (rand(100, 200) * (($rider['race_performance'] + $rider['performance'] + $rider['wet_performance'])/6));
            elseif($meteo['name'] == 'Heavy Rain')
                $difference = (rand(100, 200) * (($rider['race_performance'] + $rider['performance'] + $rider['wet_performance']*1.5)/7));
            $difference = round($difference, 0);
            $lap_time = ($track['lap_time'] + round($track['lap_time'] * $meteo['percentage_difference']/100, 0)); 
            $lap_time += $lap_time * (100 - $category['lap_slower'])/100;
            $lap_time += $difference;

            // Crash chance
            $crash1 = rand(0, 100);
            $crash2 = rand(0, 100);
            $mistake1 = rand(0, 75);
            $mistake2 = rand(0, 75);
            if($crash1 < $rider['crash_possibility']/2 AND $crash2 < $rider['crash_possibility']/2) {
                $DNF = 1;
                $lap_time = 0;
                echo "<label style='color: red; margin-right: 10px;'>" . $rider['rider_name'] . " " . $rider['rider_surname'] . " has crashed!</label>";
            } elseif($mistake1 < $rider['crash_possibility']/2 AND $mistake2 < $rider['crash_possibility']/2) {
                $lap_time += rand(1000, 5000);
                echo "<label style='color: yellow; margin-right: 10px;'>" . $rider['rider_name'] . " " . $rider['rider_surname'] . " has made a mistake!</label>";
            }
        
            // Insert the lap time
            $sql = "INSERT INTO race_results (idRider, idRace, session, total_time, lap, DNF) 
                    VALUES (" . $rider['idRider'] . ", " . $race['idRace'] . ", 'Race', " . ($rider['total_time'] + $lap_time) . ", " . $lap . ", " . $DNF . ")";
            $insert = mysqli_query($conn, $sql);
            if(!$insert)
                die("Error: " . mysqli_error($conn));
        }
        // Update race status
        echo "</div>";
        if($lap == round($track['race_distance']*$category['percentage_race_distance']/100)-1) {
            $sql = "UPDATE Race SET status = 'Race_End' WHERE idRace = " . $race['idRace'];
        } elseif($race['status'] == 'Race_End'){
            $sql = "UPDATE Race SET status = 'Standings' WHERE idRace = " . $race['idRace'];
        } else {
            $sql = "UPDATE Race SET status = 'Race_Lap_" . $lap . "' WHERE idRace = " . $race['idRace'];
        }
        $update = mysqli_query($conn, $sql);
        if(!$update)
            die("Error: " . mysqli_error($conn));   
    }