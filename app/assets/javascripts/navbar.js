$(document).on('turbolinks:load', () => {
  $('.navbar-menu-btn').click(() => {
    $('#left-navbar-container').toggle('fast');
    $('.main-content').toggleClass('col-md-10');
  });
});
