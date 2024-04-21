<?php
    require_once '../config.php';
    require_once '../functions.php';

    // Get the current race
    $race = getRace();
    $track = getTrack($race['idTrack']);
    $meteo = getMeteo($race['idMeteo']);
    $category = getCategory(3);

    if($race['status'] == 'Pre_Qualifying'){
        // Get the riders
        $sql = "SELECT * FROM rider 
        INNER JOIN Team ON rider.idTeam = team.idTeam 
        WHERE idCategory = 3";
        $result = mysqli_query($conn, $sql);
        if(!$result)
            die("Error: " . mysqli_error($conn));

        // Generate lap times
        while($rider = mysqli_fetch_assoc($result)){
            if($meteo['name'] == 'Sunny')
                $difference = (rand(0, 100) * ($rider['qualy_performance'] + $rider['performance']/2.5));
            elseif($meteo['name'] == 'Light Rain')
                $difference = (rand(0, 100) * (($rider['qualy_performance'] + $rider['performance'] + $rider['wet_performance']/0.5)/3));
            elseif($meteo['name'] == 'Heavy Rain')
                $difference = (rand(0, 100) * (($rider['qualy_performance'] + $rider['performance'] + $rider['wet_performance'])/3.5));
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
                die("Error: " . mysqli_error($conn));
        }

        // Update race status
        $sql = "UPDATE Race SET status = 'Qualifying_One' WHERE idRace = " . $race['idRace'];
        $update = mysqli_query($conn, $sql);
        if(!$update)
            die("Error: " . mysqli_error($conn));
    }
?>