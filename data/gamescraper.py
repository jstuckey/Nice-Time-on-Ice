import os
import re
import urllib2
from bs4 import BeautifulSoup
from bs4 import Tag

def scrapeForSeason(seasonID, gameType):
        
    # Open the file to write to
    if rootDir:
        scrapeFile = open('data/gamescrape.txt', 'a')
    else:
        scrapeFile = open('gamescrape.txt', 'a')
    
    # Regular expression for parsing game links to extract the game ID
    gameLinkPattern = re.compile('/ice/recap\.htm\?id=')
    
    print 'Connecting to nhl.com for season ' + seasonID + (', Playoffs' if gameType == '3' else '') + '...'
    
    # Make some soup out of the nhl.com schedule page
    soup = BeautifulSoup(urllib2.urlopen('http://www.nhl.com/ice/schedulebyseason.htm?season=' + seasonID + '&gameType=' + gameType + '&team=&network=&venue=').read())
    
    print 'Scraping nhl.com schedule for season' + seasonID + '...'
    
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
      gameDate = None
      homeTeam = None
      awayTeam = None
      nhlGameID = None
      
      # Get the td tags from the current tr tag
      tds = row('td')
      
      # Loop through td tags and look for the date, away team abbreviation, home team abbreviation, and nhl game ID
      for col in tds:
          # td classes are:
          # - date
          # - team (x2)
          # - time
          # - tvInfo
          # - skedLinks
          
          # Try to get the div that contains the game date
          dateDivs = col('div', {'class' : 'skedStartDateSite'})
          if dateDivs and not gameDate:
              # Found the game date div (More than one. Use the first div)
              gameDate = unicode(dateDivs[0].string)
          
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
                  # Also check for Atlanta for seasons before 2011-2012. Atlanta will not have an anchor tag. Poor Thrashers...
                  if isinstance(teamNameAnchor, Tag) and 'rel' in teamNameAnchor.attrs:
                      # Pull out the rel attribute for the away team and the home team
                      # The away team td is always before the home team td
                      if not awayTeam:
                          awayTeam = teamNameAnchor['rel'][0]
                      elif not homeTeam:
                          homeTeam = teamNameAnchor['rel'][0]
                  elif div.string == 'Atlanta':
                      # Hardcode ATL as the away/home team for Atlanta
                      # The away team td is always before the home team td
                      if not awayTeam:
                          awayTeam = 'ATL'
                      elif not homeTeam:
                          homeTeam = 'ATL'                      
          # Try to get the anchor that contains the game recap link
          # The recap link contains the nhl game ID
          skedLinkAnchors = col('a', {'class', 'btn'})
          if skedLinkAnchors:
              # Loop through the anchors and look for the recap link 
              for anchor in skedLinkAnchors:
                 # Use the reg ex compiled above to check if it is a recap link
                 regExMatch = gameLinkPattern.match(anchor['href'])
                 if regExMatch:
                     # Extract the nhl game ID from the end of the recap link
                     nhlGameID = anchor['href'][regExMatch.end():]
         
      # Check if we parsed out all the info from the current tr
      if gameDate and awayTeam and homeTeam and nhlGameID:              
          scrapeFile.write(seasonID + '***' + ('Regular' if gameType == '2' else 'Playoffs' ) + '***' + awayTeam + '***' + homeTeam + '***' + gameDate + '***' + nhlGameID + '\n')
          print 'Wrote to scrape file: ' + awayTeam + ' at ' + homeTeam + ' on ' + gameDate + ' (' + nhlGameID + ')'
              
    # Close the file connection
    scrapeFile.close()
    
if __name__ == "__main__":
    
    # Check if calling this script from the project root or the data folder
    rootDir = True
    if os.getcwd().find('/data') >= 0:
        rootDir = False
    
    # Remove old scrape file
    if rootDir:
        os.system('rm data/gamescrape.txt')
    else:
        os.system('rm gamescrape.txt')
    
    # Scrape game data for the following seasons
    scrapeForSeason('20072008', '2')
    scrapeForSeason('20072008', '3')
    scrapeForSeason('20082009', '2')
    scrapeForSeason('20082009', '3')
    scrapeForSeason('20092010', '2')
    scrapeForSeason('20092010', '3')
    scrapeForSeason('20102011', '2')
    scrapeForSeason('20102011', '3')
    scrapeForSeason('20112012', '2')
    scrapeForSeason('20112012', '3')

    # Call ruby script to load scraped data into database using DataMapper
    if rootDir:
        os.system("ruby data/databaseload.rb 'gamescrape.txt'")
    else:
        os.system("ruby databaseload.rb 'gamescrape.txt'")