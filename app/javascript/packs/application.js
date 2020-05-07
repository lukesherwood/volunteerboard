// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
import {} from 'jquery-ujs'
import "../stylesheets/application"

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})

$(document).ready(function() {
  $('#solicitations').bind('cocoon:before-insert', function(e,solicitation_to_be_added) {
      solicitation_to_be_added.fadeIn('slow');
  });

  $('#solicitations').bind('cocoon:after-insert', function(e, added_solicitation) {
      //added_solicitation.css("background","red");
  });

  $('#solicitations').bind('cocoon:before-remove', function(e, solicitation) {
      $(this).data('remove-timeout', 1000);
      solicitation.fadeOut('slow');
  })

});

 
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
