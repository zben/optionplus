// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require backbone
//= require optionplus
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree .

$(document).keydown(function(e){
    if (e.keyCode == 37) { 
       $('option:selected', 'select[name="strike"]').removeAttr('selected').prev('option')
       .attr('selected', 'selected').change();
       return false;
    }
    else if (e.keyCode ==39 ){
       $('option:selected', 'select[name="strike"]').removeAttr('selected').next('option')
       .attr('selected', 'selected').change();
       return false;
    }

    else if (e.keyCode ==38 ){
       $('option:selected', 'select[name="expiration"]').removeAttr('selected').next('option')
       .attr('selected', 'selected').change();
       return false;
    }

    else if (e.keyCode ==40 ){
       $('option:selected', 'select[name="expiration"]').removeAttr('selected').prev('option')
       .attr('selected', 'selected').change();
       return false;
    }

    else if (e.keyCode ==13 ){ //enter
       $('input[name="id"]').blur();
       return false;
    }
    else if (e.keyCode ==33 ){ //page up
       var selected = $('input[name="period"]:checked');
       var prev = selected.parent().prev('li').find('input');
       if(prev.length == 1){
         selected.removeAttr('checked');
         prev.attr('checked','checked').change();
       }
       return false;
    }
    else if (e.keyCode ==34 ){ //page down
       var selected = $('input[name="period"]:checked');
       var next = selected.parent().next('li').find('input');
       if(next.length == 1){
         selected.removeAttr('checked');
         next.attr('checked','checked').change();
       }
       return false;
    }
    else if (e.keyCode ==32 ){ //space
      var selected = $('input[name="option_type"]:checked');
      var next = selected.parent().next('label').find('input');
      var prev = selected.parent().prev('label').find('input');
      if(next.length == 1){
        selected.removeAttr('checked');
        next.attr('checked','checked').change();
      }
      else{
        selected.removeAttr('checked');
        prev.attr('checked','checked').change();
      }
       return false;
    }
     else if (e.keyCode ==17 ){ //control
       $('input#ticker').focus().select();
       return false;
    }




});


