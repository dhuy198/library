document.addEventListener("turbo:load", () => {
    document.querySelectorAll(".delete-btn").forEach((btn) => {
        btn.addEventListener("click", function (e) {
            e.preventDefault()
            Swal.fire({
                title: "Xác nhận xóa người dùng?",
                icon: "waring",
                showCancelButton: true,
                confirmButtonText: "Có",
                cancelButtonText: "Hủy",
                confirmButtonColor: "#d33",
                cancelButtonColor: "#3085d6",
            }).then((result) => {
                if (result.isConfirmed) {
                    const form = btn.closest("form")
                    if (form) form.submit()
                }
            })
        })
    })
})