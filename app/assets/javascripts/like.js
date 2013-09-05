$(function () {
  $('.posts-all').on("click", ".like-button", 
    function (event) {
      event.preventDefault();
      var userId = $(event.currentTarget).attr("user-id");
      var postId = $(event.currentTarget).attr("post-id");
      var likeCount = $(".like-count-" + postId).attr("data-like-count");


      $.ajax({
        url: "/users/" + userId + "/posts/" + postId + "/likes",
        type: "POST",
        dataType: "json",
        success: function (response) {  
            console.log("LIKE success callback")
            $(event.currentTarget).toggleClass("like-button");
            $(event.currentTarget).toggleClass("unlike-button");
            $(event.currentTarget).text("Unlike");
   
            debugger
            $(".like-count-" + postId).text("☝ " + (parseInt(likeCount) + 1));
        }
      }).done(function (like){
        $("button[post-id= '" + postId + "']").attr("like-id", like.id);
      });
 
    })

  $('.posts-all').on("click", ".unlike-button", 
      function (event){
        event.preventDefault();
        var userId = $(event.currentTarget).attr("user-id");
        var postId = $(event.currentTarget).attr("post-id");
        var likeId = $(event.currentTarget).attr("like-id");
        var likeCount = $(".like-count-" + postId).attr("data-like-count");

       $.ajax({
          url: "/users/" + userId + "/posts/" + postId + "/likes/" + likeId,
          type: "DELETE",
          dataType: "json",
          success: function () {
            console.log("UNLIKE success callback");
            $(event.currentTarget).toggleClass("unlike-button");
            $(event.currentTarget).toggleClass("like-button");
            $(event.currentTarget).text("Like");

            debugger
            $(".like-count-" + postId).text("☝ " + (parseInt(likeCount) - 1));
          },
          // error: function(error) {
          //   console.log(error);
          // }
        });
     });
  })

