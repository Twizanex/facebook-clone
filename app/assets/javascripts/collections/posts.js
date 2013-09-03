FacebookClone.Collections.Posts = Backbone.Collection.extend({

  model: FacebookClone.Models.Post,
  url: "/posts",

  comparator: function(post) {
    return post.get("created_at")
  }

});
