<!DOCTYPE html>
<?php
include "controlUser.php";
header('Content-Type: text/html; charset=utf-8');

session_start();

if(isset($_SESSION["username"])){
  header("Location: kucharka.php"); 
  exit;
}

if (!empty($_POST)){
  checkInputs();
}

function checkInputs(){
  $username = $_POST["username"];
  $password = $_POST["password"];
  $password_again = $_POST["password-again"];

  if (strlen($username) >= 4 && strlen($username) <= 16 && strlen($password) >= 6 && strlen($password) <= 50 && $password == $password_again && !isUsernameTaken($username)){
    createUser(); 
  }
  else{
    echo "Nastala chyba při vytváření uživatele! Zkontrolujte zda jste zadali správné jméno a heslo.";
  }
}

?>

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
        echo '<button onclick="location.href = \'prihlaseni.php\';" type="button" class="prihlasovani">Přihlásit se</button>';
      }
    ?>
  </header>
  <main>
    <form action="registrace.php" method="post">
      <h3> Pokud ještě nemáte účet, tak si ho vytvořte:</h3>
      <div class="formular-obsah">
      Uživatelské jméno: * <label><input placeholder="jannovak007" name="username" type="text" required maxlength="16" minlength="4"></label> <div class="chyba-popisek" id="jmeno-chyba"></div> <br>
      Heslo: * <label><input name="password" type="password" required minlength="6" maxlength="50"></label> <div class="chyba-popisek" id="hesla-chyba"> </div> <br>
      Potvrďte heslo: * <label><input name="password-again" type="password" required></label> <br>
      <input name="username-taken" hidden> 
    </div>
      <input type="submit" value="Zaregistrovat se" disabled>
      <p class="poznamka">* = povinné</p>
    </form>
  </main>
  <footer>
    <p>Kontakt:
      <a href="mailto:jonondre@fel.cvut.cz">jonondre@fel.cvut.cz</a>
    </p>
  </footer>

  <script src="registrace.js"></script>
</body>


</html>