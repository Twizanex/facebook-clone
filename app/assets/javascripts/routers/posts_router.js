FacebookClone.Routers.Posts = Backbone.Router.extend({
  routes: {
    "" : "indexPosts"
  },

  initialize: function (options) {
    this.collection = options.collection;
  },

  indexPosts: function () {
    var postIndex = new FacebookClone.Views.PostsIndex({
      collection : this.collection
    })
    $(".content").html(postIndex.render().$el);
  }


});
