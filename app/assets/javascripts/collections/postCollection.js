var MessageBoard = MessageBoard || {
  Models: {},
  Collections: {},
  Views: {}
};

MessageBoard.Collections.PostCollection = Backbone.Collection.extend({

  model: MessageBoard.Models.Post,
  url: '/posts'
});
