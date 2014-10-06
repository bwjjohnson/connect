// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap/bootstrap-tooltip
//= require turbolinks
//= require bootstrap
//= require_tree .

var ready;
ready = function() {
  (function ($) {
      $.each(['show', 'hide'], function (i, ev) {
        var el = $.fn[ev];
        $.fn[ev] = function () {
          this.trigger(ev);
          return el.apply(this, arguments);
        };
      });
    })(jQuery);

  $('#delete-confirm').on('show', function() {
    var $submit = $(this).find('.btn-danger'),
    href = $submit.attr('href');
    $submit.attr('href', href.replace('identifier', $(this).data('id')));
  });

  $('.delete-confirm').click(function(e) {
    e.preventDefault();
    $('#delete-confirm').data('id', $(this).data('id')).modal('show');
  });

  $("a[rel='tooltip']").tooltip();
  $('.popover').popover();
};

function showFlash(type, msg){
  $("#alert_area").html("\
    <div id=\"alert_"+type+"\" class=\"alert alert-"+type+" fade in\" style=\"display: none;\">\
      <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\
      <div id=\"flash_"+type+"\"></div>\
    </div>\
  ");
  $("#flash_"+type).text(msg);
  $("#alert_"+type).fadeIn();
}

// Use this so that we get document ready events using turbolinks
$(document).ready(ready);
$(document).on('page:load', ready);
