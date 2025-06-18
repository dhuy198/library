document.addEventListener("DOMContentLoaded", () => {
    function toggleField(selectId, fieldId) {
        const select = document.getElementById(selectId);
        const field = document.getElementById(fieldId);

        if (!select || !field) return;

        function updateVisibility() {
            field.style.display = select.value === "" ? "block" : "none";
        }

        select.addEventListener("change", updateVisibility);
        updateVisibility();
    }

    toggleField("author-select", "new-author-fields");
    toggleField("genre-select", "new-genre-fields");
});
