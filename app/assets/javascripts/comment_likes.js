// $(function () {
//   $('.posts-all').on("click", ".comment-like-button", 
//     function (event) {
//       event.preventDefault();
//       var userId = $(event.currentTarget).attr("user-id");
//       var postId = $(event.currentTarget).attr("post-id");
//       var commentId = $(event.currentTarget).attr("comment-id");
//       var commentLikeCount = $(".comment-like-count-" + postId).attr("data-like-count");

//       $.ajax({
//         url: "/users/" + userId + "/posts/" + postId + "/comments/" + commentId + "/comment_likes",
//         type: "POST",
//         dataType: "json",
//         success: function (response) {  
//             console.log("LIKE success callback");
//             $(event.currentTarget).toggleClass("comment-like-button");
//             $(event.currentTarget).toggleClass("comment-unlike-button");
//             $(event.currentTarget).text("Unlike");
   
//             debugger
//             $(".comment-like-count-" + commentId).text("☝ " + (parseInt(commentLikeCount) + 1));
//         }
//       }).done(function (like){
//         $("button[comment-id= '" + commentId + "']").attr("like-id", like.id);
//       });
 
//     })

//   $('.posts-all').on("click", ".comment-unlike-button", 
//       function (event){
//         event.preventDefault();
//         var userId = $(event.currentTarget).attr("user-id");
//         var postId = $(event.currentTarget).attr("post-id");
//         var commentId = $(event.currentTarget).attr("comment-id");
//         var commentLikeId = $(event.currentTarget).attr("comment-like-id");
//         var commentLikeCount = $(".comment-like-count-" + postId).attr("data-like-count");

//        $.ajax({
//         url: "/users/" + userId + "/posts/" + postId + "/comments/" + commentId + "/comment_likes/" + commentLikeId,
//           type: "DELETE",
//           dataType: "json",
//           success: function () {
//             console.log("UNLIKE success callback");
//             $(event.currentTarget).toggleClass("comment-unlike-button");
//             $(event.currentTarget).toggleClass("comment-like-button");
//             $(event.currentTarget).text("Like");

//             debugger
//             $(".comment-like-count-" + commentId).text("☝ " + (parseInt(commentLikeCount) - 1));
//           },
//           // error: function(error) {
//           //   console.log(error);
//           // }
//         });
//      });
//   })

