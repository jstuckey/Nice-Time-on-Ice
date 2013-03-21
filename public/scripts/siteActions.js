$(document).ready(function() {
	// Season global var
	currentSeasonID = '20122013';
   
	// Game type global var
	currentGameType = 'Regular'
   
	// Team global var
	currentTeamID = null;
   
	// Set selected default season
	var currentSeasonHref = '   '
	$(".season:first").parent().addClass('selected');
   
	// Hide Atlanta <li> by default. Poor Thrashers...
	$(".team:contains('Atlanta')").parent().hide();
   
	// Hide load mask divs
	$('.loadMask').hide();
   
	// Check for cookie containing the selected team option
	var foundTeamCookie = false;
	var allCookies = document.cookie.split(';');
	for (var cookieIndex = 0; cookieIndex < allCookies.length; cookieIndex++) {
		// Check if the current cookie is for the selected option
		var cookieName = allCookies[cookieIndex].split('=')[0];
		if (cookieName === 'selectedTeam' || cookieName === ' selectedTeam') { // Note the preceeding whitespace
			// Get cookie value load the selected team
			var cookieValue = allCookies[cookieIndex].split('=')[1];
			clickedTeam(cookieValue);
			foundTeamCookie = true;	 
			break;
		}
  	}
  
	// Load Washington by default. Go Caps!
	if (!foundTeamCookie) {
		clickedTeam('WSH');
	}
	
	// Disable 2012-2013 playoffs for now
	$($('#seasonList li a')[1]).addClass('disabled');
	$($('#seasonList li a')[1]).removeAttr('href');
   
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
			
			// Select the first link in the list
			var firstGameID = $('#gameList').children('li:first').children('a').attr('href').substr(24, 10);
			clickedGame(firstGameID);
		}
	});	
}

function clickedGame(gameID) {
	
	// Add a class to the selected game so it gets styled
	$(".game").parent().removeClass('selected');
	$(".game[href*='" + gameID + "']").parent().addClass('selected');
	
	// Show links activity indicator
	$('#Links .loadMask').show();
	$('#Links .activityIndicator').activity();
	
	// Clear previous link data
	clearGameLinks();
	
	$.ajax({
		url:'/seasons/' + currentSeasonID + '/games/' + gameID + '/links',
		success: function(data, textStatus, jqXHR) {
			// Append link html
			$("#gameLinkList").append(data);
			$("#gameLinkList").show();
			
			// Set game number in header
			$('#gameNumber').text(gameID);
			
			// Hide links activity indicator
			$('#Links .loadMask').hide();
			$('#Links .activityIndicator').activity(false);
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
	$('#Links .loadMask').show();
	$('#Links .activityIndicator').activity();
	
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
			$('#Links .loadMask').hide();
			$('#Links .activityIndicator').activity(false);
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
