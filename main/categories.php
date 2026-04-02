<?php

include_once "db_connect.php";

function getAllCategories(){
    $conn = connectDB();

    $sql = "SELECT id, name, icon FROM categories";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        return $result;
    } 
    else{
        return false;
    }
}

function createMenuButtons(){
    $all_categories = getAllCategories();
    if($all_categories != false){
        while($row = $all_categories->fetch_assoc()) {
            echo '<a href="kucharka.php?category=' . $row["id"] . '" class="a-btn"><span class="icon">';
            echo $row["icon"];
            echo "</span><br>";
            echo $row["name"];
            echo "</a>";
        }
    }
}

function createCategoryCheckboxes(){
    $all_categories = getAllCategories();
    if($all_categories != false){
        while($row = $all_categories->fetch_assoc()) {
            echo '<label class="checkbox-label"><input type="checkbox" name="categories[]" value="' . $row["id"] . '">';
            echo $row["name"] . '</label>';
        }
    }
}

?>
