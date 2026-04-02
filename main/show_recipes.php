<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

include_once "db_connect.php";



function getRecipesFromCategory($categoryID, $limit, $offset){
    $conn = connectDB();

    $stmt = $conn->prepare("SELECT recipes.* 
    FROM recipes JOIN recipe_category ON recipes.id = recipe_category.recipe_id
    WHERE recipe_category.category_id = ? LIMIT ? OFFSET ?");

    $stmt->bind_param("iii", $categoryID, $limit, $offset);
    $stmt->execute();

    $result = $stmt->get_result();

    $recipes = [];

    while ($row = $result->fetch_assoc()) {
        $recipes[] = $row;
    }

    return $recipes;
}


function showRecipeCard($recipe){
    echo "<a class='a-btn' href='kucharka.php?recipe=" . $recipe['id'] . "'>" . $recipe['name'] . "";
    echo "</a> <br>";
}


function showPagesButtons($total_pages_count, $page, $categoryID){
    $visible = 4;

    if($page > $total_pages_count){
        $page = $total_pages_count;
    }
    else if($page < 1){
        $page = 1;
    }

    echo "<br>";
    
    //previous
    if($page > 1){
        $previous = $page - 1;
        echo "<a class='page-btn' href='kucharka.php?category=" . $categoryID . "&page=" . $previous . "'> < </a>"; 
    }
    
    //current
    echo "<a class='page-btn' href='kucharka.php?category=" . $categoryID . "&page=" . $page . "'>" . $page . "</a>";

    //next 3
    for ($i = 1; $i <= 3; $i++) {
        $next_page = $page + $i;

        if($next_page <= $total_pages_count){
            echo "<a class='page-btn' href='kucharka.php?category=" . $categoryID . "&page=" . $next_page . "'>" . $next_page . "</a>";
        }
    }

    //next
    if($page < $total_pages_count){
        $next = $page + 1;
        echo "<a class='page-btn' href='kucharka.php?category=" . $categoryID . "&page=" . $next . "'> > </a>"; 
    }

}


function getTotalRecipesInCategory($categoryID){
    $conn = connectDB();

    $stmt = $conn->prepare("
        SELECT COUNT(*) as total 
        FROM recipe_category 
        WHERE category_id = ?
    ");

    $stmt->bind_param("i", $categoryID);
    $stmt->execute();

    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    return $row['total'];
}


function showRecipesPage($page, $categoryID){
    $offset = ($page - 1) * 10;
    $recipes = getRecipesFromCategory($categoryID, 10, $offset);

    foreach($recipes as $recipe){
        showRecipeCard($recipe);
    }

    $total_recipes_in_category = getTotalRecipesInCategory($categoryID);
    $total_pages_count = ceil($total_recipes_in_category / 10);

    showPagesButtons($total_pages_count, $page, $categoryID);
}


function getRecipeByID($recipeID){
    $conn = connectDB();

    $stmt = $conn->prepare("SELECT * FROM recipes WHERE id = ?");

    $stmt->bind_param("i", $recipeID);
    $stmt->execute();

    $result = $stmt->get_result();

    $row = $result->fetch_assoc();

    return $row;
}


function showRecipe($recipeID){
    $recipe = getRecipeByID($recipeID);

    echo "<h2>" . $recipe["name"] . "</h2>";

    echo "<h4> Ingredience </h4>";
    echo nl2br($recipe["ingredients"]) . "<br>";

    echo "<h4> Postup </h4>";
    echo nl2br($recipe["process"]) . "<br><br>";

    echo "Autor: " . $recipe["author"] . "<br>";

    $created = $recipe["created"];
    $formatted_date = date("d. m. Y", strtotime($created));
    echo "Přidáno: " . $formatted_date;

}