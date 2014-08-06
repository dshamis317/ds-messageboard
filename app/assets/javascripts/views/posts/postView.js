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
  },
  events: {
    'click [name="post_title"]' : 'showPostMessage',
    'click [name="delete"]' : 'deletePost',
    'click [name="edit"]' : 'editPost'
  },
  showPostMessage: function() {
    if ($(this.$el.children()[1]).is(":hidden")) {
      $(this.$el.children()[1]).slideDown().show();
    } else {
      $(this.$el.children()[1]).slideUp();
    }
  },
  deletePost: function() {
    this.model.destroy()
    return this
  },
  editPost: function() {
    var that = this;
    this.$el.html(this.editTemplate({post: this.model.toJSON()}));
    this.$el.find('form').on('submit', function(e) {
      e.preventDefault();
      var titleField = that.$el.find('input');
      var newTitle = titleField.val();
      var postField = that.$el.find('textarea');
      var newPost = postField.val();
      that.model.set({title: newTitle, message: newPost});
      that.model.save();
    })
    return this;
  }
});
