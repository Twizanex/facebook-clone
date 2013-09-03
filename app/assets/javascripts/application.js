// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.serializeJSON
//= require jquery.timeago
//= require_tree .



  $("form.new-post").on("click", '"input type="submit"', 
    debugger
    function (event) {
      event.preventDefault();
      var formData = $(this.form).serializeJSON().post;
      var user_id = $(this.form).attr("data-user-id");

      $.ajax({
        url: "/users/" + user_id + "/posts",
        type: "POST",
        data: formData,
        success: function () {
          $(".posts-all").prepend('<div class="post-indiv">' + '</div>')
          console.log("here");
        }
      })
    });