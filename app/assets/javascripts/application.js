//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_self
//= require_tree .

$(document).ready(function() {
  if ($('#postcomment').length > 0 && $('.error').length > 0) {
    window.location = window.location.href + "#postcomment";
  }
});