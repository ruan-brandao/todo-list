$(document).ready(function() {
  $(".destroy-task").click(function() {
    $(this).prev().prop("checked", true);
    $(this).parent().fadeOut();
  });
});
