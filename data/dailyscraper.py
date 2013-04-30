import os
import sys
import re
import time
import urllib2
from bs4 import BeautifulSoup
from bs4 import Tag
  
if __name__ == "__main__":
    
    # Hardcode this season's seasonID
    seasonID = '20122013'
    
    # Check if calling this script from the project root or the data folder
    rootDir = True
    if os.getcwd().find('/data') >= 0:
        rootDir = False
    
    # Remove old scrape file
    if rootDir:
        os.system('rm data/dailyscrape.txt')
    else:
        os.system('rm dailyscrape.txt')
    
    # Open the file to write to
    if rootDir:
        scrapeFile = open('data/dailyscrape.txt', 'a')
    else:
        scrapeFile = open('dailyscrape.txt', 'a')
    
    # Regular expressions for parsing game links to extract the game ID
    previewLinkPattern = re.compile('/ice/preview\.htm\?id=')
    recapLinkPattern = re.compile('/ice/recap\.htm\?id=')
    
    print 'Connecting to nhl.com daily schedule...'
    
    # Make some soup out of the nhl.com daily schedule page
    soup = BeautifulSoup(urllib2.urlopen('http://www.nhl.com/ice/schedulebyday.htm').read(), 'html5lib')
    
    print 'Scraping nhl.com schedule for today\'s games...'
    
    # Check if there are games scheduled for today
    noGamesDiv = soup('div', {'id' : 'noGamesScheduled'})
    if noGamesDiv:
        print 'No games scheduled for today'
        sys.exit()
    
    # Today's date is in the h3 tag inside the contentBlock div
    # Date format is EEEE MMMM dd, yyyy - Needs to be EEE MMM dd, yyyy for consistency
    gameDateRaw = soup('div', {'class' : 'contentBlock'})[0].h3.contents[0]
    gameDateRaw = gameDateRaw.replace('\n', '')
    gameDateRaw = gameDateRaw.replace('- FINAL GAMES', '')
    
    gameDateObj = time.strptime(gameDateRaw.strip(), '%A %B %d, %Y')
    gameDate = time.strftime('%a %b %d, %Y', gameDateObj)

    # Get table elements with class == schedTbl
    scheduleTables = soup('table', {'class' : 'schedTbl'})
    if len(scheduleTables) > 1:
        # More than one schedule table on the page. Use the last one
        scheduleTable = scheduleTables[len(scheduleTables) - 1]
    else:
        # Only one schedule table
        scheduleTable = scheduleTables[0]
    
    # Loop through the tr tags in the schedule table
    for row in scheduleTable.tbody('tr'):
        # Variables to scrape
        homeTeam = None
        awayTeam = None
        nhlGameID = None
        
        # Get the td tags from the current tr tag
        tds = row('td')
        
        # Loop through td tags and look for the date, away team abbreviation, home team abbreviation, and nhl game ID
        for col in tds:
            # td classes are:
            # - team (x2)
            # - time
            # - tvInfo
            # - skedLinks
            
            # Try to get the div that contains the team name (either away or home)
            teamNameDivs = col('div', {'class' : 'teamName'})
            if teamNameDivs:
                # Loop through the team divs and try to pull out the team abbreviation
                for div in teamNameDivs:
                    # Get the anchor inside the div that holds the team abbreviation
                    # The anchor should be the first child element of the div
                    teamNameAnchor = div.contents[0]
                  
                    # Check if we actually got the anchor and that it has a rel attribute
                    # The rel attribute holds the team abbreviation
                    # The All Star Game tds have a different structure, so this check is necessary. Silly All Star Game...
                    if isinstance(teamNameAnchor, Tag) and 'rel' in teamNameAnchor.attrs:
                        # Pull out the rel attribute for the away team and the home team
                        # The away team td is always before the home team td
                        if not awayTeam:
                            awayTeam = teamNameAnchor['rel'][0]
                        elif not homeTeam:
                            homeTeam = teamNameAnchor['rel'][0]    
                                            
            # Try to get the anchor that contains the game preview link
            # The preview link contains the nhl game ID
            skedLinkAnchors = col('a', {'class', 'btn'})
            if skedLinkAnchors:
                # Loop through the anchors and look for the preview link 
                for anchor in skedLinkAnchors:
                    # Use the regular expressions compiled above to check for game link
                    regExMatch1 = previewLinkPattern.match(anchor['href'])
                    regExMatch2 = recapLinkPattern.match(anchor['href'])
                    if regExMatch1:
                        # Extract the nhl game ID from the end of the preview link
                        nhlGameID = anchor['href'][regExMatch1.end():]
                    elif regExMatch2:
                        # Extract the nhl game ID from the end of the recap link
                        nhlGameID = anchor['href'][regExMatch2.end():]

        # Check if we parsed out all the info from the current tr
        if gameDate and awayTeam and homeTeam and nhlGameID:
            # Write game to scrape file
            scrapeFile.write(seasonID + '***' + ('Regular' if nhlGameID[5] == '2' else 'Playoffs' ) + '***' + awayTeam + '***' + homeTeam + '***' + gameDate + '***' + nhlGameID + '\n')
            print 'Wrote to scrape file: ' + awayTeam + ' at ' + homeTeam + ' on ' + gameDate + ' (' + nhlGameID + ')'
              
    # Close the file connection
    scrapeFile.close()
    
    # Call ruby script to load scraped data into database using DataMapper
    if rootDir:
        os.system("ruby data/databaseload.rb 'dailyscrape.txt'")
    else:
        os.system("ruby databaseload.rb 'dailyscrape.txt'")