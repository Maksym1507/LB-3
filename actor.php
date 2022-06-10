<?php
  header('Content-Type: text/xml');
  header('Cache-Control: no-cache, must-revalidate');
    include "connect.php";
    $actor = $_GET['actor']; 
    $sql = $dbh->prepare(
    "SELECT * FROM actor
    inner join film_actor on actor.ID_Actor = film_actor.FID_Actor
    inner join film on film_actor.FID_Film = film.ID_FILM
    where actor.name = :actor"
    );
    $sql->execute(array('actor' => $actor));
    echo '<?xml version="1.0" encoding="utf-8"?>';
    echo "<root>";
    while ($row = $sql->fetch(PDO::FETCH_BOTH)) {
        $film = $row[5];
        $date = $row[6];
        $country = $row[7];
        $quality = $row[8];
        $resolution = $row[9];
        $codec = $row[10];
        $producer = $row[11];
        $director = $row[12];
        $carrier = $row[13];
        echo "<row><actor>$actor</actor><film>$film</film><date>$date</date><country>$country</country><quality>$quality</quality><resolution>$resolution</resolution><codec>$codec</codec><producer>$producer</producer><director>$director</director><carrier>$carrier</carrier></row>";
    }
    echo "</root>"
    ?>