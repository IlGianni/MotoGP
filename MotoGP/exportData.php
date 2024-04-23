<?php
    require_once 'config.php';

    // Set the path where you want to save the SQL file
    $sqlFilePath = 'C:\\xampp\\htdocs\\MotoGP\\data\\backup.sql';

    $dbUsername = "root";
    $dbName = "motogp";

    // Define the command to execute mysqldump
    $command = "C:\\xampp\\mysql\\bin\\mysqldump -u " . escapeshellarg($dbUsername) . " " . escapeshellarg($dbName) . " > " . escapeshellarg($sqlFilePath);

    // Execute the command
    exec($command, $output, $returnStatus);

    // Check if mysqldump command executed successfully
    if ($returnStatus === 0) {
        echo "Database backup successfully created.";
        echo "<script>location.href='index.php';</script>";
    } else {
        echo "Error creating database backup.<br>";
        echo "Command: " . $command . "<br>";
        echo "Output: " . implode("<br>", $output) . "<br>";
        echo "Return Status: " . $returnStatus . "<br>";
    }
?>
