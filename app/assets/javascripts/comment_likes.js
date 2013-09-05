$(function () {
  $('.comment').on("click", ".comment-like-button", 
    function (event) {
      event.preventDefault();

      var userId = $(event.currentTarget).attr("user-id");
      var postId = $(event.currentTarget).attr("post-id");
      var commentId = $(event.currentTarget).attr("comment-id");
      var commentLikeCount = $(".comment-like-count-" + commentId).attr("data-like-count");

      $.ajax({
        url: "/users/" + userId + "/posts/" + postId + "/comments/" + commentId + "/comment_likes",
        type: "POST",
        dataType: "json",
        success: function () {  
            $(event.currentTarget).toggleClass("comment-like-button");
            $(event.currentTarget).toggleClass("comment-unlike-button");
            $(event.currentTarget).text("Unlike");     

            if ($(event.currentTarget).data("numClicks")) {
              $(".comment-like-count-" + commentId).text("☝ " + parseInt(commentLikeCount));
              $(event.currentTarget).data("numClicks", null);
            }
            else {
              $(".comment-like-count-" + commentId).text("☝ " + (parseInt(commentLikeCount) + 1));
              $(event.currentTarget).data("numClicks", 1);
            }     
        }
      }).done(function (comment_like){
        $("button[comment-id= '" + commentId + "']").attr("comment-like-id", comment_like.id);
      });
 
    })

  $('.comment').on("click", ".comment-unlike-button", 
      function (event){
        event.preventDefault();
        var userId = $(event.currentTarget).attr("user-id");
        var postId = $(event.currentTarget).attr("post-id");
        var commentId = $(event.currentTarget).attr("comment-id");
        var commentLikeId = $(event.currentTarget).attr("comment-like-id");
        var commentLikeCount = $(".comment-like-count-" + commentId).attr("data-like-count");

       $.ajax({
        url: "/users/" + userId + "/posts/" + postId + "/comments/" + commentId + "/comment_likes/" + commentLikeId,
          type: "DELETE",
          dataType: "json",
          success: function () {
            $(event.currentTarget).toggleClass("comment-unlike-button");
            $(event.currentTarget).toggleClass("comment-like-button");
            $(event.currentTarget).text("Like");

            if ($(event.currentTarget).data("numClicks")) {
              $(".comment-like-count-" + commentId).text("☝ " + parseInt(commentLikeCount));
              $(event.currentTarget).data("numClicks", null);
            }
            else {
              $(".comment-like-count-" + commentId).text("☝ " + (parseInt(commentLikeCount) - 1));
              $(event.currentTarget).data("numClicks", 1);
            }     
          }
        });
     });
  })

