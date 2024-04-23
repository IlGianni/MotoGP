<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>
<?php
    require_once 'config.php';
    require_once 'functions.php';

    $race = getRace();

    $sql = "TRUNCATE TABLE race_results";
    $result = mysqli_query($conn, $sql);
    if(!$result)
        echo "Error: " . mysqli_error($conn);

    $sql = "TRUNCATE TABLE qualifying";
    $result = mysqli_query($conn, $sql);
    if(!$result)
        echo "Error: " . mysqli_error($conn);

    $sql = "TRUNCATE TABLE standings";
    $result = mysqli_query($conn, $sql);
    if(!$result)
        echo "Error: " . mysqli_error($conn);

    $sql = "DELETE FROM Race";
    $result = mysqli_query($conn, $sql);
    if(!$result)
        echo "Error: " . mysqli_error($conn);

    $sql = "INSERT INTO Race (idRace, idTrack, idSeason, status, category) VALUES (1, 1, 1, 'Pre_Qualifying', 'Moto3')";
    $result = mysqli_query($conn, $sql);
    if(!$result)
        echo "Error: " . mysqli_error($conn);
    
    $sql = "INSERT INTO standings VALUES (1, 1, 0, 1);
    INSERT INTO standings VALUES (2, 1, 0, 1);
    INSERT INTO standings VALUES (3, 1, 0, 1);
    INSERT INTO standings VALUES (4, 1, 0, 1);
    INSERT INTO standings VALUES (5, 1, 0, 1);
    INSERT INTO standings VALUES (6, 1, 0, 1);
    INSERT INTO standings VALUES (7, 1, 0, 1);
    INSERT INTO standings VALUES (8, 1, 0, 1);
    INSERT INTO standings VALUES (9, 1, 0, 1);
    INSERT INTO standings VALUES (10, 1, 0, 1);
    INSERT INTO standings VALUES (11, 1, 0, 1);
    INSERT INTO standings VALUES (12, 1, 0, 1);
    INSERT INTO standings VALUES (13, 1, 0, 1);
    INSERT INTO standings VALUES (14, 1, 0, 1);
    INSERT INTO standings VALUES (15, 1, 0, 1);
    INSERT INTO standings VALUES (16, 1, 0, 1);
    INSERT INTO standings VALUES (17, 1, 0, 1);
    INSERT INTO standings VALUES (18, 1, 0, 1);
    INSERT INTO standings VALUES (19, 1, 0, 1);
    INSERT INTO standings VALUES (20, 1, 0, 1);
    INSERT INTO standings VALUES (21, 1, 0, 1);
    INSERT INTO standings VALUES (22, 1, 0, 1),
    (23, 1, 0, 3), 
    (24, 1, 0, 3),
    (25, 1, 0, 3),
    (26, 1, 0, 3),
    (27, 1, 0, 3),
    (28, 1, 0, 3),
    (29, 1, 0, 3),
    (30, 1, 0, 3),
    (31, 1, 0, 3),
    (32, 1, 0, 3),
    (33, 1, 0, 3),
    (34, 1, 0, 3),
    (35, 1, 0, 3),
    (36, 1, 0, 3),
    (37, 1, 0, 3),
    (38, 1, 0, 3),
    (39, 1, 0, 3),
    (40, 1, 0, 3),
    (41, 1, 0, 3),
    (42, 1, 0, 3),
    (43, 1, 0, 3),
    (44, 1, 0, 3),
    (45, 1, 0, 3),
    (46, 1, 0, 3),
    (47, 1, 0, 3),
    (48, 1, 0, 3), 
    (49, 1, 0, 2),
    (50, 1, 0, 2), 
    (51, 1, 0, 2),
    (52, 1, 0, 2), 
    (53, 1, 0, 2),
    (54, 1, 0, 2),
    (55, 1, 0, 2),
    (56, 1, 0, 2),
    (57, 1, 0, 2),
    (58, 1, 0, 2),
    (59, 1, 0, 2),
    (60, 1, 0, 2),
    (61, 1, 0, 2),
    (62, 1, 0, 2),
    (63, 1, 0, 2),
    (64, 1, 0, 2),
    (65, 1, 0, 2),
    (66, 1, 0, 2),
    (67, 1, 0, 2),
    (68, 1, 0, 2),
    (69, 1, 0, 2),
    (70, 1, 0, 2),
    (71, 1, 0, 2),
    (72, 1, 0, 2),
    (73, 1, 0, 2),
    (74, 1, 0, 2),
    (75, 1, 0, 2),
    (76, 1, 0, 2),
    (77, 1, 0, 2),
    (78, 1, 0, 2)";
    $result = mysqli_multi_query($conn, $sql);
    if(!$result)
        echo "Error: " . mysqli_error($conn);
?>  