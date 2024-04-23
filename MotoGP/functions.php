<?php
    require_once 'config.php';

    // Function to check if a color is light or dark
    function isColorLight($color) {
        $hex = str_replace('#', '', $color);
        $c_r = hexdec(substr($hex, 0, 2));
        $c_g = hexdec(substr($hex, 2, 2));
        $c_b = hexdec(substr($hex, 4, 2));
        $brightness = (($c_r * 299) + ($c_g * 587) + ($c_b * 114)) / 1000;
        return $brightness > 155; // Valore soglia per la luminosità
    }

    // Function to get the race
    function getRace(){
        global $conn;
        $sql = "SELECT * FROM Race 
        ORDER BY idRace DESC LIMIT 1";
        $result = mysqli_query($conn, $sql);
        if(!$result)
            die("Error: " . mysqli_error($conn));
        $row = mysqli_fetch_assoc($result);
        return $row;
    }

    // Function to get the track
    function getTrack($idTrack){
        global $conn;
        $sql = "SELECT * FROM Track WHERE idTrack = $idTrack";
        $result = mysqli_query($conn, $sql);
        if(!$result)
            die("Error: " . mysqli_error($conn));
        $row = mysqli_fetch_assoc($result);
        return $row;
    }

    // Function to get the meteo
    function getMeteo($idMeteo){
        global $conn;
        $sql = "SELECT * FROM Meteo WHERE idMeteo = $idMeteo";
        $result = mysqli_query($conn, $sql);
        if(!$result)
            die("Error: " . mysqli_error($conn));
        $row = mysqli_fetch_assoc($result);
        return $row;
    }

    // Function to get the category
    function getCategory($idCategory){
        global $conn;
        $sql = "SELECT * FROM Category WHERE idCategory = $idCategory";
        $result = mysqli_query($conn, $sql);
        if(!$result)
            die("Error: " . mysqli_error($conn));
        $row = mysqli_fetch_assoc($result);
        return $row;
    }
?>