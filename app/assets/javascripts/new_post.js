// $(function () {
//   $("form.new-post").on("click", "input[type='submit']",
//     function (event) {
//       event.preventDefault();
//       var formData = $(this.form).serializeJSON().post;
//       var userId = $(this.form).attr("user-id")
//       debugger

//       $.ajax({
//         url: "/users/" + userId + "/posts",
//         type: "POST",
//         dataType: "json",
//         success: function() {
//           $(".posts-all").prepend()
//         }
//       })


//     });
// })