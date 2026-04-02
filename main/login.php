<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

include "db_connect.php";

function logIn($username, $password){

    $conn = connectDB();

    $stmt = $conn->prepare("SELECT username, password FROM users WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    $hash = $row['password'];
    if(password_verify($password, $hash)){
        $_SESSION["username"] = $username;
        $_SESSION["logged_in"] = true;
        header("Location: kucharka.php");
        exit;
    }
    else{
        echo "Nesprávné uživatelské jméno nebo heslo";
    }
    

}

?>
