<?php
function laczenie() {
    $db = new mysqli("localhost", "root", "", "wedkowanie");
    if ($db->connect_errno) {
        echo "nie udalo sie podlaczyc do bazy";
    }
    return $db;
}

function skrypt1($db) {
    $query = "SELECT nazwa, akwen, wojewodztwo FROM Ryby JOIN Lowisko ON Ryby.id = Lowisko.ryby_id WHERE rodzaj = 3";
    $result = mysqli_query($db, $query);

    echo "<ul>";
    while ($row = mysqli_fetch_array($result)) {
    echo "<li>" . $row['nazwa'] . " pływa w rzece " . $row['akwen'] . ", " . $row['wojewodztwo'] . "</li>";
    }
    echo "</ul>";
}

function skrypt2 ($db) {
    $query = "SELECT id, nazwa, wystepowanie FROM Ryby WHERE styl_zycia = 1";
    $result = mysqli_query($db, $query);

    while ($row = mysqli_fetch_array($result)) {
    echo "<tr><td>" . $row['id'] . "</td><td>" . $row['nazwa'] . "</td><td>" . $row['wystepowanie'] . "</td></tr>";
    }
}

function rozlacz($db) {
    mysqli_close($db);
}
?>
