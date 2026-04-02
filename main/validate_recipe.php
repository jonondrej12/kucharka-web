<?php

function checkForm(){
  $name = $_POST["name"];
  $password = $_POST["ingredients"];
  $password_again = $_POST["process"];

  $author = $_SESSION["username"];
  $created = date("Y-m-d");

  if (strlen($username) >= 4 && strlen($username) <= 16 && strlen($password) >= 6 && strlen($password) <= 50 && $password == $password_again && !isUsernameTaken($username)){
    createUser(); 
  }
  else{
    echo "Nastala chyba při vytváření uživatele! Zkontrolujte zda jste zadali správné jméno a heslo.";
  }
}

?>