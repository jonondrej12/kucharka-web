let password_valid = false;
let username_valid = false;

function validatePassword() {
    let password = document.querySelector('input[name="password"]').value;
    let passwordAgain = document.querySelector('input[name="password-again"]').value;
    let passwordErrorText = document.getElementById("hesla-chyba")

    if(password.length >= 6 && password.length <= 50){
        passwordErrorText.innerText = "";
    }
    else{
        passwordErrorText.innerText = "Heslo musí mít 6-50 znaků!";
    }

    if (passwordAgain != "" && password != passwordAgain) {
        passwordErrorText.innerText = "Hesla se neshodují!";
    }

    if(password.length >= 6 && password.length <= 50 && password == passwordAgain){
        password_valid = true;
    }
    else{
        password_valid = false;
    }
    if (password_valid && username_valid) {
        enableSubmitButton();
    }
    else {
        disableSubmitButton();
    }
}

function validateUsernameLength() {
    let usernameInput = document.querySelector('input[name="username"]').value;
    let usernameErrorText = document.getElementById("jmeno-chyba");

    if(usernameInput.length < 4){
        usernameErrorText.innerText = "Jméno musí mít alespoň 4 znaky";
        username_valid = false;
    }
    if(usernameInput.length > 16){
        usernameErrorText.innerText = "Jméno může mít maximálně 16 znaků";
        username_valid = false;
    }
    if(usernameInput.length >= 4 && usernameInput.length <= 16){
        usernameErrorText.innerText = "";
    }
}

function validateUsernameAvailability() {
    let usernameInput = document.querySelector('input[name="username"]').value;
    let usernameTakenInput = document.querySelector('input[name="username-taken"]');
    let usernameErrorText = document.getElementById("jmeno-chyba");

    if (usernameInput.length >= 4 && usernameInput.length <= 16) {
        usernameErrorText.innerText = "";
        var checkUsernameRequest = new XMLHttpRequest();
        checkUsernameRequest.open("GET", "controlUser.php?function=is_username_taken&usernameInput=" + usernameInput, true); // tady bych mozna mel dat nejaky ${encodeURIComponent(username)}
        checkUsernameRequest.send();
        checkUsernameRequest.onreadystatechange = function () {
            if (checkUsernameRequest.status == 200) {
                if (this.responseText == "taken") {
                    usernameErrorText.innerText = "Jméno je již obsazeno!"
                    username_valid = false;
                    usernameTakenInput.value = true
                } else if (this.responseText == "not taken") {
                    usernameErrorText.innerText = ""
                    username_valid = true;
                    usernameTakenInput.value = false
                }
                if (password_valid && username_valid) {
                    enableSubmitButton();
                }
                else {
                    disableSubmitButton();
                }
            } else {
                alert("Chyba při požadavku. Kód odpovědi: " + checkUsernameRequest.status);
            }
        };
    }
}

function enableSubmitButton() {
    let submitButton = document.querySelector('input[type="submit"]');
    submitButton.disabled = false;
    submitButton.style.opacity = "1";
}

function disableSubmitButton() {
    let submitButton = document.querySelector('input[type="submit"]');
    submitButton.disabled = true;
    submitButton.style.opacity = "0.5";
}



document.querySelector('input[name="password-again"]').addEventListener("input", validatePassword);
document.querySelector('input[name="password"]').addEventListener("input", validatePassword);
document.querySelector('input[name="username"]').addEventListener("input", validateUsernameLength);
document.querySelector('input[name="username"]').addEventListener("blur", validateUsernameAvailability);