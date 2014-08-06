var MessageBoard = MessageBoard || {
  Models: {},
  Collections: {},
  Views: {}
};

MessageBoard.Views.PostView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.model, 'destroy', this.remove);
    this.listenTo(this.model, 'all', this.render);
  },
  tagName: 'li',
  className: 'post',
  template: JST['posts/index'],
  editTemplate: JST['posts/editPost'],
  render: function() {
    var renderedHTML = this.template({post: this.model.toJSON()});
    this.$el.html(renderedHTML);
    return this;
  }
});
