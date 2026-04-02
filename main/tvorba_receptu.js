let inputsFilled = false;
let categorySet = false;


function validateInputFields() {
    let name = document.querySelector("#nazev-receptu-in").value;
    let ingredients = document.querySelector("#ingredience").value;
    let process = document.querySelector("#postup").value;

    let errorText = document.getElementById("input-chyba");

    if(name.length == 0 ||  ingredients.length == 0 || process == 0){
        errorText.innerText = "Všechny položky by měli být vyplněny!";
        inputsFilled = false;
    }
    else{
        errorText.innerText = "";
        inputsFilled = true;
        validateCategoryInput();
    }

    updateSubbmitButton();
}


function validateCategoryInput(){
    let checkedBoxes = document.querySelectorAll('input:checked');

    let errorText = document.getElementById("input-chyba");

    if (checkedBoxes.length === 0) {
        errorText.innerText = "Vyberte alespoň jednu kategorii receptu!";
        categorySet = false;
    } else {
        errorText.innerText = "";
        categorySet = true;
    }

    updateSubbmitButton();
}


function updateSubbmitButton(){
    let submitButton = document.querySelector("#sub");

    if(inputsFilled && categorySet){
        submitButton.disabled = false;
    }
    else if(!inputsFilled || !categorySet){
        submitButton.disabled = true;
    }
}


document.querySelector("#nazev-receptu-in").addEventListener("blur", validateInputFields);
document.querySelector("#ingredience").addEventListener("blur", validateInputFields);
document.querySelector("#postup").addEventListener("blur", validateInputFields);

let checkboxes = document.querySelectorAll('input[type="checkbox"]');

for (let i = 0; i < checkboxes.length; i++) {
    checkboxes[i].addEventListener("change", validateCategoryInput);
}

