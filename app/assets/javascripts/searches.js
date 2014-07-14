$(function() {
  $('#search').submit(function() {
    console.log('searching');
    $('.search-button').children().removeClass('fa-search').addClass('fa-spinner fa-spin');
  });
});
