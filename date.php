    <?php
    include "connect.php";
    $date_1 = $_GET['date_1'];
    $date_2 = $_GET['date_2'];

    $sql = $dbh->prepare(
        "SELECT * FROM film
            where film.date between :date_1 and :date_2"
    );
    $sql->execute(array('date_1' => $date_1, 'date_2' => $date_2));
    $row = $sql->fetchAll(PDO::FETCH_OBJ);
        echo json_encode($row);
    ?>
