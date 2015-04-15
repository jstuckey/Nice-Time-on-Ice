$(document).ready(function() {
	// Season global var
	currentSeasonID = '20142015';

	// Game type global var
	currentGameType = 'Playoffs';

	prepareDefaultView();

  // Load the default team
	clickedTeam(getCurrentTeam());

});

function clickedSeason(seasonID, gameType) {
	if (currentSeasonID !== seasonID || currentGameType != gameType) {
		// Clear links
		clearGameLinks();
	}
	currentSeasonID = seasonID;
	currentGameType = gameType;

	// Add a class to the selected season so it gets styled
	$(".season").parent().removeClass('selected');
	$(".season[href*='\\'" + seasonID + "\\', \\'" + gameType + "\\'']").parent().addClass('selected');

	// Reset sort link
	$(".sort").attr("href", "javascript:clickedGameSort('ASC')");
	$(".glyph-up").addClass("glyph-down");
	$(".glyph-up").removeClass("glyph-up");

	// Show/hide Atlanta and Winnipeg depending on the season
	if (parseInt(seasonID, 10) < 20112012) {
		$(".team:contains('Atlanta')").parent().show();
		$(".team:contains('Winnipeg')").parent().hide();
	} else {
		$(".team:contains('Atlanta')").parent().hide();
		$(".team:contains('Winnipeg')").parent().show();
	}

	// Show/hide Arizona and Phoenix depending on the season
	if (parseInt(seasonID, 10) < 20142015) {
		$(".team:contains('Phoenix')").parent().show();
		$(".team:contains('Arizona')").parent().hide();
	} else {
		$(".team:contains('Phoenix')").parent().hide();
		$(".team:contains('Arizona')").parent().show();
	}

	if (currentTeamID) {
		// Reload games for team and new season
		clickedTeam(currentTeamID);
	}
}

function clickedTeam(teamID) {
	currentTeamID = teamID;

	// Add a class to the selected team so it gets styled
	$(".team").parent().removeClass('selected');
	$(".team[href*='" + teamID + "']").parent().addClass('selected');

	// Show games activity indicator
	$('#Games .loadMask').show();
	$('#Games .activityIndicator').activity();

	// Clear previous data
	clearGames();
	clearGameLinks();

	// Save as a cookie
	var expireDate = new Date();
	expireDate.setMonth(expireDate.getMonth()+6);
	document.cookie='selectedTeam' + "=" + teamID + '; expires=' + expireDate.toUTCString();

	// Get season links
	getSeasonLinks();

	$.ajax({
		url:'/seasons/' + currentSeasonID + '/games?team=' + teamID + "&gameType=" + currentGameType,
		success: function(data, textStatus, jqXHR) {
			// Append game html
			$("#gameList").append(data);
			$("#gameList").show();

			// Hide games activity indicator
			$('#Games .loadMask').hide();
			$('#Games .activityIndicator').activity(false);

			// Select the current game
			clickedGame(getCurrentGame());
		}
	});
}

function clickedGame(gameID) {

	// Add a class to the selected game so it gets styled
	$(".game").parent().removeClass('selected');
	$(".game[href*='" + gameID + "']").parent().addClass('selected');

	// Show links activity indicator
	$('#GameLinks .loadMask').show();
	$('#GameLinks .activityIndicator').activity();

	// Clear previous link data
	clearGameLinks();

	// Get games links
	$.ajax({
		url:'/seasons/' + currentSeasonID + '/games/' + gameID + '/links',
		success: function(data, textStatus, jqXHR) {
			// Append link html
			$("#gameLinkList").append(data);
			$("#gameLinkList").show();

			// Set game number in header
			$('#gameNumber').text(gameID);

			// Hide links activity indicator
			$('#GameLinks .loadMask').hide();
			$('#GameLinks .activityIndicator').activity(false);
		}
	});
}

function clickedGameSort(order) {
	// Show games activity indicator
	$('#Games .loadMask').show();
	$('#Games .activityIndicator').activity();

	// Clear previous data
	clearGames();
	clearGameLinks();

	// Change sort link
	if (order.toUpperCase() === 'DESC') {
		$(".sort").attr("href", "javascript:clickedGameSort('ASC')");
		$(".glyph-up").addClass("glyph-down");
		$(".glyph-up").removeClass("glyph-up");
	} else {
		$(".sort").attr("href", "javascript:clickedGameSort('DESC')");
		$(".glyph-down").addClass("glyph-up");
		$(".glyph-down").removeClass("glyph-down");
	}

	$.ajax({
		url:'/seasons/' + currentSeasonID + '/games?team=' + currentTeamID + '&order=' + order + '&gameType=' + currentGameType,
		success: function(data, textStatus, jqXHR) {
			$("#gameList").append(data);
			$("#gameList").show();

			// Hide games activity indicator
			$('#Games .loadMask').hide();
			$('#Games .activityIndicator').activity(false);

			// Select the first link in the list
			var firstGameID = $('#gameList').children('li:first').children('a').attr('href').substr(-12, 10);
			clickedGame(firstGameID);
		}
	});
}

function getSeasonLinks() {
	// Show links activity indicator
	$('#SeasonLinks .loadMask').show();
	$('#SeasonLinks .activityIndicator').activity();

	// Clear previous link data
	clearSeasonLinks();

	$.ajax({
		url:'/teams/' + currentTeamID +'/seasons/' + currentSeasonID + '/links?gameType=' + currentGameType,
		success: function(data, textStatus, jqXHR) {
			// Append link html
			$("#seasonLinkList").append(data);
			$("#seasonLinkList").show();

			// Set game number in header
			$('#seasonNumber').text(currentSeasonID);

			// Hide links activity indicator
			$('#SeasonLinks .loadMask').hide();
			$('#SeasonLinks .activityIndicator').activity(false);
		}
	});
}

function clearGames() {
	$("#gameList").empty();

	// Reset sort link
	$(".sort").attr("href", "javascript:clickedGameSort('ASC')");
	$(".glyph-up").addClass("glyph-down");
	$(".glyph-up").removeClass("glyph-up");
}

function clearGameLinks() {
	$("#gameLinkList").empty();
	$('#gameNumber').text('');
}

function clearSeasonLinks() {
	$("#seasonLinkList").empty();
}

function getCurrentTeam() {
	// Check if team was specified in the url
	urlTeam = urlParams.team;
	cookieTeam = getTeamCookie();

	if(urlTeam) {
		return urlTeam;
	} else if (cookieTeam) {
		return cookieTeam;
	} else {
		// Use Washington by default. Go Caps!
		return 'WSH';
	}
}

function getTeamCookie() {
	// Check for cookie containing the selected team option
	var allCookies = document.cookie.split(';');
	for (var cookieIndex = 0; cookieIndex < allCookies.length; cookieIndex++) {
		// Check if the current cookie is for the selected option
		var cookieName = allCookies[cookieIndex].split('=')[0];
		if (cookieName === 'selectedTeam' || cookieName === ' selectedTeam') { // Note the preceeding whitespace
			// Get cookie value load the selected team
			return allCookies[cookieIndex].split('=')[1];
		}
	}

	return undefined;
}

var urlParams = (function() {
	paramsObj = {};

	paramsStart = window.location.href.indexOf('?') + 1;
	params = window.location.href.slice(paramsStart).split('&');
	params.forEach(function(param) {
		kv = param.split('=');
		key = kv[0];
		value = kv[1];
		paramsObj[key] = value;
	});
	return paramsObj;
})();

function getCurrentGame() {
	urlGame = urlParams.game
	if (urlGame) {
		return urlGame;
	} else {
		return $('#gameList').children('li:first')
		                     .children('a')
		                     .attr('href')
		                     .substr(-12, 10);
	}
}

function prepareDefaultView() {
	// Hide load mask divs
	$('.loadMask').hide();

	// Hide Atlanta <li> by default. Poor Thrashers...
	$(".team:contains('Atlanta')").parent().hide();

	// Hide Phoenix <li> since they are Arizona now
	$(".team:contains('Phoenix')").parent().hide();

	// Set selected default season
	//
	// 0 for regular season
	// 1 for playoffs
	$("#seasonList").children().eq(1).addClass('selected');

	// Disable 2014-2015 playoffs for now
  //$($('#seasonList li a')[1]).addClass('disabled');
  //$($('#seasonList li a')[1]).removeAttr('href');
}

