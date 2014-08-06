var MessageBoard = MessageBoard || {
  Models: {},
  Collections: {},
  Views: {}
};

MessageBoard.Models.Post = Backbone.Model.extend({
  idAttribute: 'id'
});
