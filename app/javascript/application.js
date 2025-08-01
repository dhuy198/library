import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
import "toggle_new_fields"
// import Swal from "sweetalert2"
import "controllers/books_controller"
import "controllers/users_controller"

document.addEventListener("turbo:load", () => {
    document.querySelectorAll(".logout-btn").forEach((btn) => {
        btn.addEventListener("click", function (e) {
            e.preventDefault()
            Swal.fire({
                title: "Bạn chắc chắn muốn đăng xuất?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Đăng xuất",
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