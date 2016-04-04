// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).ready(function() {

 $('code').each(function(i, block) {
    hljs.highlightBlock(block);
  });

  var converter = new showdown.Converter();

  $('#wiki_body').on('keyup', function() {
    // get the contents of the text field
    var markdown = $('#wiki_body').val();
    var html = converter.makeHtml(markdown);
    $('#wiki-preview').html(html);
     $('code').each(function(i, block) {
        hljs.highlightBlock(block);
      });

  });
});
