// /path/to/your/laravel-project/public/js/app.js

document.addEventListener("DOMContentLoaded", function () {
    const userData = localStorage.getItem("loggedUser");

    if (userData) {
        const userObject = JSON.parse(userData);
        document.getElementById("loginLink").style.display = "none";
        document.getElementById("loggedLink").style.display = "block";

        const userDataToSend = {
            name: userObject.name,
            id: userObject.id,
        };

        // Dispatch a custom event with user data
        const event = new CustomEvent("userLoggedIn", {
            detail: userDataToSend,
        });
        document.dispatchEvent(event);
    } else {
        document.getElementById("loginLink").style.display = "block";
        document.getElementById("loggedLink").style.display = "none";
    }
});
