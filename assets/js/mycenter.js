(function($) {
  'use strict';

  $(function() {
        $('.personalPage, .mypost, .myreceive').click(function(){
          newSrc = $(this).attr('id') + '.html'
          $('#mycontent').attr('src', newSrc)
          $('.personalPage, .mypost, .myreceive').removeClass('active')
          $(this).addClass('active')
        });

        $('.test').click(function(){
          $('.menban').show();
          $("#mymodal").modal("toggle"); 
        })
        var childItem ="";
        if(childItem!=""){
          $('.menban').show();
          $("#mymodal").modal("toggle"); 
          console.log(childItem.id);
        }

        $('.menban').click(function(){
          $('.menban').hide();
        })
        $("[name='close']").click(function(){
          childItem ="";
          $('.menban').hide();
        })
        $("#btn-receive").click(function(){
          childItem ="";
          $('.modal').hide();
          $('.menban').hide();
        })

        console.log($("#mycontent"));
        console.log($(window.frames["mycontent"].document).find('.trigger-modal'));
  });
})(jQuery);
