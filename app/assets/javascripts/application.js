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
//= require jquery-migrate-1.2.1.min
//= require jquery-ui-1.10.3.min
//= require bootstrap.min
//= require plugins.js
//= require_tree .

$(document).ready(function(){
	$(".group1").colorbox({rel:'group1'});
});

$(function() {
	var dateToday = new Date();
  $(".datepicker" ).datepicker({
    changeMonth: true,
    changeYear: true,
    minDate: dateToday,
    dateFormat: 'dd-mm-yy'
  });
});