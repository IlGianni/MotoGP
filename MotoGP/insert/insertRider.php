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
            box-sizing: border-box;
            background-color: #555555;
            color: #ffffff;
        }

        select {
            width: 80%;
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
    ?>

    <form action="insertRider.php" method="post">

        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" name="name" required>
        </div>

        <div class="form-group">
            <label for="surname">Surname</label>
            <input type="text" name="surname" required>
        </div>

        <div class="form-group">
            <label for="number">Number</label>
            <input type="text" name="number" required>
        </div>

        <div class="form-group">
            <label for="nation">Nation</label>
            <input type="text" name="nation" required>
        </div>

        <div class="form-group">
            <label for="race_performance">Race Performance</label>
            <input type="text" name="race_performance" required>
        </div>

        <div class="form-group">
            <label for="qualy_performance">Qualy Performance</label>
            <input type="text" name="qualy_performance" required>
        </div>

        <div class="form-group">
            <label for="wet_performance">Wet Performance</label>
            <input type="text" name="wet_performance" required>
        </div>

        <div class="form-group">
            <label for="crash_possibility">Crash Possibility</label>
            <input type="text" name="crash_possibility" required>
        </div>

        <div class="form-group">
            <label for="idTeam">Team</label>
            <select name="idTeam" id="idTeam" required>
                <?php
                    $sql = "SELECT * FROM team";
                    $result = mysqli_query($conn, $sql);
                    if(!$result)
                        die("Error: " . mysqli_error($conn));
                    while ($row = mysqli_fetch_assoc($result)) {
                        echo "<option value='" . $row['idTeam'] . "'>" . $row['name'] . " - " . $row['idCategory'] . "</option>";
                    }
                ?>
            </select>
        </div>

        <input type="submit" value="Insert Rider">
    </form>

    <?php
        if(isset($_POST['idTeam'])) {
            $name = $_POST['name'];
            $surname = $_POST['surname'];
            $number = $_POST['number'];
            $idTeam = $_POST['idTeam'];
            $nation = $_POST['nation'];
            $race_performance = $_POST['race_performance'];
            $qualy_performance = $_POST['qualy_performance'];
            $wet_performance = $_POST['wet_performance'];
            $crash_possibility = $_POST['crash_possibility'];

            $sql = "INSERT INTO rider (name, surname, number, nation, race_performance, qualy_performance, wet_performance, crash_possibility, idTeam) VALUES ('$name', '$surname', '$number', '$nation', '$race_performance', '$qualy_performance', '$wet_performance', '$crash_possibility', '$idTeam')";
            $result = mysqli_query($conn, $sql);
            if(!$result)
                die("Error: " . mysqli_error($conn));
            echo "<script>window.location.href='../edit/editRiders.php';</script>";
        }

        echo "<div class='button-container'>
                <button class='button-54' onclick='location.reload()'>Refresh</button>
                <button class='button-54' onclick='reset()'>Reset</button>
                <button class='button-54' onclick='location.href=\"../edit/editRiders.php\"'>Back</button>
                <button class='button-54' onclick='location.href=\"../index.php\"'>Home</button>
            </div>";
    ?>
</body>
</html>
