var MessageBoard = MessageBoard || {
  Models: {},
  Collections: {},
  Views: {}
};

MessageBoard.Views.PostListView = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 'all', this.render)
  },
  tagName: 'ul',
  render: function() {
    var that = this;
    this.$el.empty();
    _.each(this.collection.models, function(post) {
      var postView = new MessageBoard.Views.PostView({model: post});
      that.$el.append(postView.render().el);
    });
    return this;
  }
});
