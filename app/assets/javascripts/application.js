//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree .

$(document).ready(function() {
  if ($('#postcomment').length > 0 && $('#errorExplanation').length > 0) {
    window.location = window.location.href + "#postcomment";
  }
});