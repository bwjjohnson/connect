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
//= require turbolinks
//= require bootstrap
//= require_tree .

$(function() {
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
});

