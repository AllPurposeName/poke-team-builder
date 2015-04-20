$(document).ready(function () {
  $(function() {
    //single book
    $('#mybook').booklet();

    //multiple books with ID's
    $('#mybook1, #mybook2').booklet();

    //multiple books with a class
    $('.mycustombooks').booklet();
  });
});
