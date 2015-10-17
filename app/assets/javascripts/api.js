// Standard page load
$(document).ready(function() {
  setup();
});

// Turbolinks
$(document).on('page:load', function() {
  setup();
});

function setup() {
  // Hide form elements by default
  $('form').hide();

  $('li > *, li').click(function(event) {
    if ($(this).is('form')) {
      event.stopPropagation();
      return false;
    } else if ($(this).is('li')) {
      toggleFormVisibility.call(this);
    }
  });

  $('input[type=button]').click(function(event) {
    makeAPIRequest.call(this);
  });
}

function toggleFormVisibility() {
  var target = $(this);
  var animationSeconds = '1';

  if (target.hasClass('expanded')) {
    target.removeClass('expanded');
    target.find('.input').hide(animationSeconds) ;
    target.find('.output').hide(animationSeconds);
  } else {
    target.addClass('expanded');
    target.find('.input').show(animationSeconds);
  }
}

function makeAPIRequest() {
  var output = $(this).parent().siblings('.output');
  output.hide();

  var uri = assembleURI.call(this);
  callAPI(uri, function(result) {
    output.children('textarea').val(result);
    output.show('2');
  });
}

function assembleURI() {
  var inputs = $(this).siblings('input[type=text]').toArray();
  var uriTemplate = $(this).attr('uri-template');
  var uriPieces = uriTemplate.split('/');

  var pathComponents = uriPieces.map(function(component) {
    if (component.match(/^\{/)) {
      // Substitute the value entered in the text box for the placeholder
      return inputs.shift().value;
    } else {
      return component;
    }
  });

  return pathComponents.join('/');
}

function callAPI(url, callback) {
  $.ajax({
    url: url,
    dataType: 'text',
    success: function(data, textStatus, jqXHR) {
      callback(data);
    },
    error: function(jqXHR, textStatus, errorThrown) {
      callback(textStatus);
    }
  });
}
