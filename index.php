<!DOCTYPE HTML>
<html>
<head>
    <title>Lab3</title>
    <script src ="ajax.js"></script>
    <link href="style.css" rel="stylesheet">
</head>
<body>
    <p>Фильмы с жанром <select name="genre" id="genre">
            <?php
            include 'connect.php';
            $sql = "SELECT DISTINCT title FROM genre";
            foreach ($dbh->query($sql) as $row) {
                echo "<option>";
                print($row[0]);
                echo "</option>";
            }
            ?>
        </select>
        <button onclick="textFunc()"> ОК </button></p>

        <p>Фильмы с актёром <select name="actor" id="actor">
            <?php
            include 'connect.php';
            $sql = "SELECT DISTINCT name FROM actor";
            foreach ($dbh->query($sql) as $row) {
                echo "<option>";
                print($row[0]);
                echo "</option>";
            }
            ?>
        </select>
        <button onclick="XMLFunc()"> ОК </button></p>


        <p>Фильмы, которые были выпущены в промежутке с <select name="date_1" id="date_1">
            <?php
            include 'connect.php';
            $sql = "SELECT DISTINCT date FROM film";
            foreach ($dbh->query($sql) as $row) {
                echo "<option>";
                print($row[0]);
                echo "</option>";
            }
            ?>
        </select> по
        <select name="date_2" id="date_2">
            <?php
            include 'connect.php';
            $sql = "SELECT DISTINCT date FROM film";
            foreach ($dbh->query($sql) as $row) {
                echo "<option>";
                print($row[0]);
                echo "</option>";
            }
            ?></p>
        </select>
        <button onclick="JSONFunc()"> ОК </button>
<div id= "result"></div>
</body>

</html>