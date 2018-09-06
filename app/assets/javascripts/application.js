// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(function() {
    $('#table th, #table .pagination').on('click', 'a', function() {
        $.getScript(this.href);
        return false;
    });

    $('.fa-graduation-cap').hover(function() {
        $('.fa-graduation-cap').toggleClass('pulse');
    });
});

var extract = function(id) {
    var lName = document.getElementById(`student-lname-${id}`),
        fName = document.getElementById(`student-fname-${id}`),
        age = document.getElementById(`student-age-${id}`),
        lNameReal = document.getElementById(`student-lname-real-${id}`),
        fNameReal = document.getElementById(`student-fname-real-${id}`),
        ageReal = document.getElementById(`student-age-real-${id}`);

    lNameReal.value = lName.value;
    fNameReal.value = fName.value;
    ageReal.value = age.value;

    $(`#student-submit-btn-${id}`).click();
};

