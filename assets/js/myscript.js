function myFunction() {
    var x = document.getElementById("password");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }

    var x = document.getElementById("passwordAgain");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}