<?php
header('Content-Type: text/html; charset=utf-8');

include "categories.php";
include "show_recipes.php";

if (session_status() === PHP_SESSION_NONE) {
    session_start();
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
        echo '<button onclick="location.href = \'prihlaseni.php\';" type="button" class="prihlasovani">Přihlásit se</button>';
        echo '<button onclick="location.href = \'registrace.php\';" type="button" class="prihlasovani"> Zaregistrovat se</button>';
      }
      else{
        echo '<button onclick="location.href = \'logout.php\';" type="button" class="prihlasovani"> Odhlásit se</button>';
        echo '<button onclick="location.href = \'tvorba_receptu.php\';" type="button" class="prihlasovani"> Přidat recept</button>';
      }
    ?>
    
  </header>
  <main>
    <?php
      if(!isset($_GET["category"]) && !isset($_GET["recipe"])){
        echo "<h2>Kategorie jídel:</h2>";
        echo '<article class="kategorie">';

        createMenuButtons();

        echo "</article>";
      }
      else if(isset($_GET["category"])){
        $categoryID = $_GET["category"];

        if(!isset($_GET["page"])){
          showRecipesPage(1, $categoryID);
        }
        else{
          $page = $_GET["page"];
          showRecipesPage($page, $categoryID);
        }
      }
      else if(isset($_GET["recipe"])){
        $recipe = $_GET["recipe"];
        showRecipe($recipe);
      }
    ?>
  </main>
  <footer>
    <p>Kontakt:
      <a href="mailto:jonondre@fel.cvut.cz">jonondre@fel.cvut.cz</a>
    </p>
  </footer>
</body>

</html>