$(function(){
 $('.button').click(function(form){
 var id = (this.id);
 var text_val= $('#box_'+id).val();
 $.ajax({
 type: 'POST',
 url: 'posts/add_comment',
 data: {text: text_val, p_id: id}
 }).done(function(ret){
 $('#box_'+id).val("");
 $('#myspan_'+id).append(ret);
 });

 });
});




