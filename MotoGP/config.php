<?php
    $servername = "localhost";
    $username = "root";
    $password="";
    $nomeDB="motogp";

    // Create connection
    $conn = new mysqli($servername, $username, $password,$nomeDB);
    // Check connection
    if ($conn->connect_error)
        die("Problemi di connessione: " . $conn->connect_error);
?>