$(document).ready(function() {
	// Hide activity indicator divs and form elements
	$('.loadMask').hide();
	$('form').hide();

	// Show api parameter form
   	$('li').click(function(event) {
   		if ($(event.target).hasClass('expanded')) {
   			// Hide input area
			$(event.target).removeClass('expanded');
   			$(event.target).children(".input").hide("1");
   			$(event.target).children(".output").hide("1");
   		} else {
   			// Show input area
   			$(event.target).addClass('expanded');
   			$(event.target).children(".input").show("1");
   		}
	});

	// Show api parameter form
	$('h3, p').click(function(event) {
		if ($(event.target).parent().hasClass('expanded')) {
   			// Hide input area
			$(event.target).parent().removeClass('expanded');
   			$(event.target).siblings(".input").hide("1");
   			$(event.target).siblings(".output").hide("1");
   		} else {
   			// Show input area
   			$(event.target).parent().addClass('expanded');
   			$(event.target).siblings(".input").show("1");
   		}

	});
});

function makeAPICall(clickedEl, apiPath) {

	// Hide the output area
	$(clickedEl).parent().siblings(".output").hide();

	// Show activity indicator
	$('.loadMask').show();
	$('.activityIndicator').activity();

	// Check if path has parameters
	if (apiPath.indexOf('{')) {
		// Loop through form inputs
		$(clickedEl).siblings(".inputLabel").each( function() {
			// Get the label text
			var currentField = $(this).text();

			// Remove the trailing colon
			currentField = currentField.substr(0, currentField.length - 1);

			// Get the value entered in the text box
			var currentValue = $(this).next().val();
			if (!currentValue) {
				currentValue = " ";
			}

			// Replace the api path placeholder with the value entered in the text box
			apiPath = apiPath.replace('{' + currentField + '}', currentValue);
		});
	}

	// Make the API call
	$.ajax({
		url:apiPath,
		dataType: 'text',
		success: function(data, textStatus, jqXHR) {
			// Populate the textarea with the returned JSON
			$(clickedEl).parent().siblings(".output").children('textarea').val(data);

			// Hide activity indicator
			$('.loadMask').hide();
			$('.activityIndicator').activity(false);

			// Show the output form
			$(clickedEl).parent().siblings(".output").show("2");
		},
		error: function(jqXHR, textStatus, errorThrown) {
			// Populate the textarea with the returned JSON
			$(clickedEl).parent().siblings(".output").children('textarea').val(textStatus + " - " + jqXHR.status + " " + errorThrown);

			// Hide activity indicator
			$('.loadMask').hide();
			$('.activityIndicator').activity(false);

			// Show the output form
			$(clickedEl).parent().siblings(".output").show("1");
		}
	});

}
