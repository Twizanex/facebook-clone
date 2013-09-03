FacebookClone.Views.PostsIndex = Backbone.View.extend({

  template: JST['posts/index'],

  events: {
    "submit form.new-post": "savePost"
  },

  render: function () {
    var renderedContent = this.template({posts: this.collection});
    this.$el.html(renderedContent);
    return this;
  },

  savePost: function(event) {
    event.preventDefault();
    var view = this;
    var newAttrs = $(event.currentTarget).serializeJSON().post
    this.collection.create(newAttrs, {
      success: function() {
        Backbone.history.navigate("#/", {trigger: true});
      },

      error: function(model, xhr, options) {
        view.setErrors(xhr.responseJSON);
        view.collection.remove(model);
      }
    });
  },

  setErrors: function(errors) {
    $(".content").children(".error").remove();
    _.each(errors, function(error) {
      var $li = $("<li>");
      $li.addClass(".error").text(error);
      $(".content").prepend($li);
    });
  }

});
