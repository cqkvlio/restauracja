<?php
    $mysqli = @new mysqli("localhost", "root", "", "baza");
    if($mysqli === false){
        die("ERROR: Could not connect. " . mysqli_connect_error());
    };
    
    echo "Connect Successfully. Host info: " . mysqli_get_host_info($mysqli);
    
    $data = $_POST['data_rez'];
    $liczba_osob = $_POST['liczba_osob'];
    $telefon = $_POST['telefon'];

    $sql = "INSERT INTO rezerwacje (data_rez, liczba_osob, telefon) VALUES ('$data', '$liczba_osob', '$telefon')";
    if(mysqli_query($mysqli, $sql)){
        
        echo "Records inserted successfully.";
    } else{
        echo "ERROR: Could not able to execute $sql. " . mysqli_error($mysqli);
    }
    
    mysqli_close($mysqli);
?>