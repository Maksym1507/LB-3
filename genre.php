<?php
    include "connect.php";
    $genre = $_GET['genre']; 
    $sql = $dbh->prepare(
    "SELECT * FROM genre
    inner join film_genre on genre.ID_Genre = film_genre.FID_Genre
    inner join film on film_genre.FID_Film = film.ID_FILM
    where genre.title = :genre"
    );
    $sql->execute(array('genre' => $genre));
    echo "<table border ='1'>";
    echo "<tr><th>Genre</th><th>Film</th><th>Date</th><th>Country</th><th>Quality</th><th>Resolution</th><th>Codec</th><th>Producer</th><th>Director</th><th>Carrier</th></tr>";
    while ($row = $sql->fetch(PDO::FETCH_BOTH)) {
        $genre = $row[1];
        $film = $row[5];
        $date = $row[6];
        $country = $row[7];
        $quality = $row[8];
        $resolution = $row[9];
        $codec = $row[10];
        $producer = $row[11];
        $director = $row[12];
        $carrier = $row[13];

        echo "<tr><td>$genre</td><td>$film</td><td>$date</td><td>$country</td><td>$quality</td><td>$resolution</td><td>$codec</td><td>$producer</td><td>$director</td><td>$carrier</td></tr>";
    }
    ?>
