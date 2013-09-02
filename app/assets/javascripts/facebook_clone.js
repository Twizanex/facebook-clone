window.FacebookClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var dataJSON = $("#bootstrapped-data").html();
    var data = { "posts" :JSON.parse(dataJSON) } ;
  
    new FacebookClone.Routers.Posts ({
      collection : new FacebookClone.Collections.Posts(data.posts)
    })

    Backbone.history.start();
  }
};

$(document).ready(function(){
  FacebookClone.initialize();
});
