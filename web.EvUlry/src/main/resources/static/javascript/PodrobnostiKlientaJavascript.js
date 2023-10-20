
document.addEventListener("DOMContentLoaded", function () {
    const checkboxDatumPrevod = document.getElementById("checkboxDatumPrevod");
    const posledniSchuzkaField = document.getElementById("posledniSchuzkaField");

    checkboxDatumPrevod.addEventListener("change", function () {
        if (this.checked) {
            posledniSchuzkaField.disabled = true; // Buňka bude neaktivní
        } else {
            posledniSchuzkaField.disabled = false; // Buňka bude aktivní
        }
    });
});
