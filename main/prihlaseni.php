<?php
header('Content-Type: text/html; charset=utf-8');

session_start();

include "login.php";

if(isset($_SESSION["username"])){
  header("Location: kucharka.php"); 
  exit;
}

if (!empty($_POST)){
  if (isset($_POST["username"]) && isset($_POST["password"])){
    $username = $_POST["username"];
    $password = $_POST["password"];
    logIn($username, $password);
  }
  else{
    echo "Nebyly vyplňeny všechny údaje.";
  }
}

?>

<!DOCTYPE html>
<html>

<head>
  <title> Kuchařka </title>
  <link rel="stylesheet" href="style.css">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
</head>

<body>
  <header>
    <a href="kucharka.php" id="title">
      <h1> 🍲 Online kuchařka 🥘 </h1>
    </a>
    <?php
      if(!isset($_SESSION["username"])){
        echo '<button onclick="location.href = \'registrace.php\';" type="button" class="prihlasovani"> Zaregistrovat se</button>';
      }
    ?>
  </header>
  <main>
    <form action="prihlaseni.php" method="post">
      <h3> Pokud již máte účet tak se přihlaste:</h3>
      <div class="formular-obsah">
      Uživatelské jméno: <input placeholder="jannovak007" name="username" type="text" required> <br>
      Heslo: <input placeholder="" name="password" type="password" required> <br>
    </div>
      <input type="submit" value="Přihlásit se" class="sub">
    </form>
  </main>
  <footer>
    <p>Kontakt:
      <a href="mailto:jonondre@fel.cvut.cz">jonondre@fel.cvut.cz</a>
    </p>
  </footer>
</body>

</html>