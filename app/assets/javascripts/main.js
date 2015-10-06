$(document).on('ready', function(event) {
  scrollToSelected();
});

$(document).on('page:change', function(event) {
  scrollToSelected();
});

function scrollToSelected() {
  var padding = 50;

  $(".selected").each(function() {
    var position = $(this).position().top - padding;
    var properties = {
      scrollTop: position
    };

    $(this).parent().parent().animate(properties, 200);
  });
}
