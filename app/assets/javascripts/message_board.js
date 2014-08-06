var MessageBoard = MessageBoard || {
  Models: {},
  Collections: {},
  Views: {}
};

MessageBoard.initialize = function() {
  var postCollection = new MessageBoard.Collections.PostCollection();
  var postListView = new MessageBoard.Views.PostListView({
    collection: postCollection,
    el: $('.posts')
  });

  postCollection.fetch();
}

function visualInitializers() {
  $('.new_post_button').on('click', function(e) {
    e.preventDefault();
    if ($('.form').is(":hidden")) {
     $('.form').slideDown();
     $(e.target).val('Hide')
   } else {
     $('.form').slideUp();
     $(e.target).val('☑ New Post')
   }
 })
}

function submitPost() {

}

$(document).ready(function(){
  $('.form').hide();

  MessageBoard.initialize();

  visualInitializers();
});
