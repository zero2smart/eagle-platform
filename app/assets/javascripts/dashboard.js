// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require theme/base
//= require_tree ./global/

$(document).ready(function() {
  $('#matPrice').editable({
    mode: 'inline',
    type: 'text',
    pk: 1,
    url: '/post',
    title: 'Enter username'
  });

  $('#matStatus').editable({
    mode: 'inline',
    type: 'select',
    pk: 1,
    url: '/post',
    value: 1,
    title: 'Enter username',
    source: [
      {value: 1, text: 'Active'},
      {value: 2, text: 'Inactive'},
    ]
  });

  $('#matUnit').editable({
    mode: 'inline',
    type: 'select',
    pk: 1,
    url: '/post',
    value: 1,
    title: 'Enter username',
    source: [
      {value: 1, text: 'Yard'},
      {value: 2, text: 'Ton'},
    ]
  });
});
