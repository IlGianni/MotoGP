<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Rider</title>
    <style>
        @font-face {
            font-family: 'MotoGP Bold';
            src: url('../fonts/MotoGP_Bold.ttf') format('truetype');
        }

        body {
            background-color: #444444;
            font-family: 'MotoGP Bold', sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        form {
            max-width: 400px;
            margin: 20px;
            padding: 20px;
            background-color: #555555;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .form-group {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            margin-bottom: 10px;
        }

        label {
            flex: 0 0 30%;
            margin-right: 10px;
            text-align: left;
        }

        input[type="text"],
        input[type="number"],
        select {
            font-family: 'MotoGP Bold', sans-serif;
            flex: 0 0 70%;
            padding: 2px;
            margin-bottom: 5px;
            border: 0;
            border-radius: 5px;
            background-color: #555555;
            color: #ffffff;
        }

        input[type="number"] {
            width: 151px;
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
    </style>
</head>
<body>
    <?php
        require_once '../config.php';
        require_once '../functions.php';

        if(isset($_POST['idTeam'])) {
            $idTeam = $_POST['idTeam'];
            $sql = "SELECT * FROM team WHERE idTeam = $idTeam";
            $result = mysqli_query($conn, $sql);
            if(!$result)
                die("Error: " . mysqli_error($conn));
            $row = mysqli_fetch_assoc($result);
        }
    ?>

    <form action="editTeam.php" method="post">
        <input type="hidden" name="idTeam" value="<?php echo $idTeam; ?>">

        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" name="name" value="<?php echo $row['name']; ?>" required>
        </div>

        <div class="form-group">
            <label for="nation">Nation</label>
            <input type="text" name="nation" value="<?php echo $row['nation']; ?>" required>
        </div>

        <div class="form-group">
            <label for="color">Color</label>
            <input type="text" name="color" value="<?php echo $row['color']; ?>" required>
        </div>

        <div class="form-group">
            <label for="performance">Performance</label>
            <input type="number" name="performance" value="<?php echo $row['performance']; ?>" required>
        </div>

        <input type="submit" value="Edit Team">
    </form>

    <?php
        if(isset($_POST['performance'])) {
            $idTeam = $_POST['idTeam'];
            $name = $_POST['name'];
            $nation = $_POST['nation'];
            $color = $_POST['color'];
            $performance = $_POST['performance'];

            $sql = "UPDATE team SET name = '$name', nation = '$nation', color = '$color', performance = $performance WHERE idTeam = $idTeam";
            $result = mysqli_query($conn, $sql);
            if(!$result)
                die("Error: " . mysqli_error($conn));
            echo "<script>window.location.href='editRiders.php';</script>";
        }

        echo "<div class='button-container'>
                <button class='button-54' onclick='location.reload()'>Refresh</button>
                <button class='button-54' onclick='reset()'>Reset</button>
                <button class='button-54' onclick='location.href=\"editRiders.php\"'>Back</button>
                <button class='button-54' onclick='location.href=\"../index.php\"'>Home</button>
            </div>";
    ?>
</body>
</html>
