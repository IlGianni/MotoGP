<?php
    require_once '../config.php';
    require_once '../functions.php';

    // Get the current race
    $race = getRace();
    $track = getTrack($race['idTrack']);
    $meteo = getMeteo($race['idMeteo']);
    $category = getCategory(3);

    if($race['status'] == 'Qualifying_Two'){
        // Get the riders
        $sql = "-- Primi 14 piloti dalla sessione 'Pre_Qualifying'
        SELECT * 
        FROM rider 
        INNER JOIN Team ON rider.idTeam = team.idTeam 
        INNER JOIN Qualifying ON rider.idRider = qualifying.idRider
        WHERE idCategory = 3
        AND idRace = " . $race['idRace'] . "
        AND session = 'Pre_Qualifying'
        AND position < 15
        
        UNION
        
        -- Primi 4 piloti dalla sessione 'Qualifying_One'
        SELECT *
        FROM rider 
        INNER JOIN Team ON rider.idTeam = team.idTeam 
        INNER JOIN Qualifying ON rider.idRider = qualifying.idRider
        WHERE idCategory = 3 
        AND idRace = " . $race['idRace'] . "
        AND session = 'Qualifying_One'
        AND position < 5
        
        -- Applicare l'ORDER BY e LIMIT alla query complessiva
        ORDER BY session DESC, position ASC
        LIMIT 18;
        
        ";
        $result = mysqli_query($conn, $sql);
        if(!$result)
            echo "Error: " . mysqli_error($conn);

        // Generate lap times
        while($rider = mysqli_fetch_assoc($result)){
            if($meteo['name'] == 'Sunny')
                $difference = (rand(0, 100) * ($rider['qualy_performance'] + $rider['performance']/2.5));
            elseif($meteo['name'] == 'Light Rain')
                $difference = (rand(0, 100) * (($rider['qualy_performance'] + $rider['performance'] + $rider['wet_performance'])/3.5));
            elseif($meteo['name'] == 'Heavy Rain')
                $difference = (rand(0, 100) * (($rider['qualy_performance'] + $rider['performance'] + $rider['wet_performance']*1.5)/4));
                // If it's not sunny, the lap time is slower
            $difference = round($difference, 0);
            $lap_time = ($track['lap_time'] + round($track['lap_time'] * $meteo['percentage_difference']/100, 0)); 
            $lap_time += $lap_time * (100 - $category['lap_slower'])/100;
            $lap_time += $difference;

            // Insert the lap time
            $sql = "INSERT INTO qualifying (idRider, idRace, lap_time, session) 
                VALUES (" . $rider['idRider'] . ", " . $race['idRace'] . ", '" . $lap_time . "', '" . $race['status'] . "')"; 
            $insert = mysqli_query($conn, $sql);
            if(!$insert)
            echo "Error: " . mysqli_error($conn);
        }

        // Update race status
        $sql = "UPDATE Race SET status = 'Race_Start' WHERE idRace = " . $race['idRace'];
        $update = mysqli_query($conn, $sql);
        if(!$update)
            echo "Error: " . mysqli_error($conn);
    }
?>