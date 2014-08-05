var MessageBoard = MessageBoard || {
  Models: {},
  Collections: {},
  Views: {}
};

MessageBoard.Views.PostView = Backbone.View.extend({

  template: JST['posts/index']

});
