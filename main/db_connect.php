<?php

function connectDB(){
    $servername = "localhost";
    $name = "root";
    $pass = "";
    $dbname = "kucharka";
    
    // Create connection
    $conn = new mysqli($servername, $name, $pass, $dbname);

    //Check connection error
    if ($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
    }

    return $conn;
}

?>