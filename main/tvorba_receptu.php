<?php
header('Content-Type: text/html; charset=utf-8');

session_start();

include "categories.php";
include "create_recipe.php";

if(!isset($_SESSION["username"])){
  header("Location: kucharka.php"); 
  exit;
}

if (!empty($_POST)){
  checkInputs();
}


function checkInputs(){
  $name = $_POST["name"];
  $ingredients = $_POST["ingredients"];
  $process = $_POST["process"];
  $categories = $_POST["categories"];

  if ($name != "" && $ingredients != "" && $process != "" && count($categories) >= 1){
    createRecipe($name, $ingredients, $process, $categories);
  }
  else{
    echo "Nastala chyba při vytváření receptu! Zkontrolujte zda jste vyplnily všechny položky.";
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
      if(isset($_SESSION["username"])){
        echo '<button onclick="location.href = \'logout.php\';" type="button" class="prihlasovani"> Odhlásit se</button>';
      }
    ?>  
  </header>
  <main>
    <form action="tvorba_receptu.php" method="post" id="recept-form">
      <h3> Přidávání nového receptu:</h3>
      <div class="formular-obsah">
      Zadejte název: <input type="text" id="nazev-receptu-in" name="name">  <br> <br>
      Zadejte ingredience: <textarea id="ingredience" name="ingredients"></textarea> <br> <br>
      Zadejte postup: <textarea id="postup" name="process"></textarea><br><br>
      Vyberte kategorie:
      <br>
      <?php
        createCategoryCheckboxes();
      ?>
       <br>
       <div class="chyba-popisek" id="input-chyba"> </div>
    </div>
    <br>
      <input type="submit" id="sub" value="Přidat recept" disabled>
    </form>
  </main>
  <footer>
    <p>Kontakt:
      <a href="mailto:jonondre@fel.cvut.cz">jonondre@fel.cvut.cz</a>
    </p>
  </footer>

  <script src="tvorba_receptu.js"></script>
</body>

</html>