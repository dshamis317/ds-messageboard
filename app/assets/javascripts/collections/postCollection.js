var MessageBoard = MessageBoard || {
  Models: {},
  Collections: {},
  Views: {}
};

MessageBoard.Collections.PostCollection = Backbone.Collection.extend({

  model: MessageBoard.Models.Post,
  url: '/posts',
  parse: function(data) {
    var posts = data.posts;
    var users = data.users;
    var userHash = {};
    $.each(users, function(user) {
      userHash[this.id] = this.name
    })
    $.each(posts, function(post) {
      this.username = userHash[this.user_id];
    })
    return posts;
      }
});
