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
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

// Blocmetrics event request
var blocmetrics = {};
blocmetrics.report = function(eventName) {
  var event = {event: { name: eventName}};
  var request = new XMLHttpRequest();
  request.open("POST", "https://mighty-eyrie-26757.herokuapp.com/api/events", true);
  request.setRequestHeader('Content-Type', 'application/json');
  request.send(JSON.stringify(event));
};

// Showdown and Hightlight markdown/preview functions
$(document).ready(function() {

 $('code').each(function(i, block) {
    hljs.highlightBlock(block);
  });

  var converter = new showdown.Converter();

  $('#wiki-preview').html(converter.makeHtml($('#wiki_body').val()));

  $('code').each(function(i, block) {
    hljs.highlightBlock(block);
  });

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
