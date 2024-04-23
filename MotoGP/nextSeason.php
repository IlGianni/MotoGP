<?php
    require_once 'config.php';
    require_once 'functions.php';
    $race = getRace();

    $sql = "SELECT * FROM rider
    INNER JOIN team ON rider.idTeam = team.idTeam
    WHERE team.idCategory != 4";
    $result = mysqli_query($conn, $sql);
    if(!$result)
        die("Error: " . mysqli_error($conn));
    echo mysqli_num_rows($result);
    while($row = mysqli_fetch_assoc($result)){
        $insertSql = "INSERT INTO standings VALUES (" . $row['idRider'] . ", " . $race['idSeason'] . ", 0, " . $row['idCategory'] . ")";
        echo $insertSql;
        $insertResult = mysqli_query($conn, $insertSql);
        if(!$insertResult)
            die("Error: " . mysqli_error($conn));
    }

    echo "<script>window.location.href='index.php';</script>";
?>
