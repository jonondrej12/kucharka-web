<?php

include_once "db_connect.php";


function addRecipeCategory($conn, $categories, $recipeId){
    $stmt = $conn->prepare("INSERT INTO recipe_category (recipe_id, category_id) VALUES (?, ?)");

    foreach ($categories as $categoryId){
        $stmt->bind_param("ii", $recipeId, $categoryId);
        if(!$stmt->execute()) {
            echo "Error: " . $sql . "<br>" . $conn->error;
            exit;
        }
    }
}


function createRecipe($name, $ingredients, $process, $categories){
    $author = $_SESSION["username"];
    $date = date("Y-m-d");

    $conn = connectDB();

    $stmt = $conn->prepare("INSERT INTO recipes (name, ingredients, process, author, created) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $name, $ingredients, $process, $author, $date);

    if($stmt->execute()) {
        $addedId = $conn->insert_id;
        addRecipeCategory($conn, $categories, $addedId);
        
        header("Location: kucharka.php");
        exit;
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
      exit;
    }
}

?>