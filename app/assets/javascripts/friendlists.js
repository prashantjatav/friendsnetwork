$(function() {
  
$('#search').keyup(function() {
var keyword = ($(this).val());
if(keyword.length > 1){
  loaduser(keyword);
}

});

var loaduser = function(keyword){

$.ajax({
type: "GET",
url: "friendlists/search_user",
data: { name: keyword }
}).done(function( res ) {
$('#mySpan').html(res)

});

}

});


function addfriend(friendid) 
  {
   var f = $(friendid).attr('id');
   $.ajax({
   type: "POST",
   url: "friendlists/add_friend",
   data: { friend_id: f  }
   }).done(function( res ) {
     $(friendid).css('display','none');
   });
  };
