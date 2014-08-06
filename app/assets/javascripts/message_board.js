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
     $('.post').slideUp();
     $(e.target).val('Hide');
   } else {
     $('.form').slideUp();
     $('.post').slideDown();
     $(e.target).val('☑ New Post');
   }
 })

  $('.title').on('click', function(e) {
    e.preventDefault();
    location.reload(true);
  })
}


$(document).ready(function(){
  $('.form').hide();

  MessageBoard.initialize();

  visualInitializers();
});
