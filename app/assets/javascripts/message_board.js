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

  $('.form').on('submit', function(e) {
    e.preventDefault();
    console.log(this)
    var titleField = $('.form_title');
    var title = titleField.val();
    var postField = $('.form_message');
    var post = postField.val();
    var userId = parseInt(window.currentUser.id);
    titleField.val('');
    postField.val('')
    postCollection.create({title: title, message: post, user_id: userId});
  })
}

function visualInitializers() {
  $('.new_post_button').on('click', function(e) {
    e.preventDefault();
    if ($('.form').is(":hidden")) {
     $('.form').slideDown();
     $(e.target).val('Hide');
   } else {
     $('.form').slideUp();
     $(e.target).val('☑ New Post');
   }
 })
}


$(document).ready(function(){
  $('.form').hide();

  MessageBoard.initialize();

  visualInitializers();
});
