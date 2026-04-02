<?php

include "db_connect.php";

//obsluha ajax pozadavku
if (isset($_GET["function"])) {
    $function = $_GET["function"];
    if ($function === "is_username_taken") {
        if(isset($_GET["usernameInput"])) {
            $username = $_GET["usernameInput"];
            $taken = isUsernameTaken($username);
            if($taken == true){
              echo "taken";
            }
            else{
              echo "not taken";
            }
        }
    }
}

function isUsernameTaken($usernameInput)
{     
   $conn = connectDB();

   $stmt = $conn->prepare("SELECT username FROM users WHERE username = ?");
   $stmt->bind_param("s", $usernameInput);
   $stmt->execute();
   $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        return true;
    }
    else{
      return false;
    }
}

function createUser(){ 
    $username = $_POST["username"];
    $password = $_POST["password"];

    $conn = connectDB();

    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    $stmt = $conn->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
    $stmt->bind_param("ss", $username, $hashed_password);

    if ($stmt->execute()) {
      header("Location: kucharka.php");
      exit;
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }
  }

  function checkUsername(){
    if (!empty($_POST)){
      $username = $_POST["username"];
      $username_taken = $_POST["username-taken"];
      if (strlen($username) < 4){
        echo "Minimálně 4 znaky!";
      }
      else if (strlen($username) > 16){
        echo "Maximálně 16 znaků!";
      }
      if ($username_taken == "true"){
        echo "Jméno je již obsazeno!";
      }
  }
  }
  
  function checkPassword(){
    if (!empty($_POST)){
      $password = $_POST["password"];
      $password_again = $_POST["password-again"];
      if(strlen($password)<6){
        echo "Minimálně 6 znaků!";
      }
      else if(strlen($password)>50){
        echo "MinMaximálně 50 znaků!";
      }
      if($password != $password_again){
        echo "Hesla se neshodují!";
      }
  }
  }
?>
