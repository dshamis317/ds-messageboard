var MessageBoard = MessageBoard || {
  Models: {},
  Collections: {},
  Views: {}
};

MessageBoard.Collections.Posts = Backbone.Collection.extend({

  model: MessageBoard.Models.Post

});
