var MessageBoard = MessageBoard || {
  Models: {},
  Collections: {},
  Views: {}
};

var postCollection;
var postListView;

MessageBoard.initialize = function() {
  var postCollection = new MessageBoard.Collections.PostCollection();
  var postListView = new MessageBoard.Views.PostListView({
    collection: postCollection,
    el: $('.posts')
  });

  postCollection.fetch();
}

$(document).ready(function(){
  MessageBoard.initialize();
});
