(function($){
  $.fn.tag_editable = function(){
    var el = $(this);
    var tag_close = el.children('li').wrapInner('<span/>').append('<a class="tag_close"></a>').find('.tag_close');
    tag_close.click(function(){
      var name = {"name": $(this).siblings('span').text()}
      console.log(name);
      $.ajax({
        type: 'POST',
        url: '/edit',
        data: name,
        success: console.log("success")
      });
      $(this).parents('li').remove();
      return false;
    })
    return el;
  }
})(jQuery);

$(function(){
  $('.editable').tag_editable();
})