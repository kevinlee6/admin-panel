$(document).on('turbolinks:load', () => {
  $('.navbar-menu-btn').click(() => {
    $('#left-navbar-container').toggle('fast');
  });
});
