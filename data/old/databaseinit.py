import sqlite3

def dbInit():
    dbConnection = sqlite3.connect('nicetimeonice.db')
    dbCursor = dbConnection.cursor()
    
    print 'Adding teams to the database... (Go Caps!)'
    
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Washington Capitals', 'WSH')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Anaheim Ducks', 'ANA')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Boston Bruins', 'BOS')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Buffalo Sabres', 'BUF')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Calgary Flames', 'CGY')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Carolina Hurricanes', 'CAR')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Chicago Blackhawks', 'CHI')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Colorado Avalanche', 'COL')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Columbus Bluejackets', 'CBJ')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Dallas Stars', 'DAL')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Detroit Red Wings', 'DET')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Edmonton Oilers', 'EDM')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Florida Panthers', 'FLA')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Los Angeles Kings', 'LAK')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Minnesota Wild', 'MIN')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Montreal Canadiens', 'MTL')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Nashville Predators', 'NSH')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'New Jersey Devils', 'NJD')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'New York Islanders', 'NYI')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'New York Rangers', 'NYR')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Ottawa Senators', 'OTT')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Philadelphia Flyers', 'PHI')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Phoenix Coyotes', 'PHX')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Pittsburgh Penguins', 'PIT')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'San Jose Sharks', 'SJS')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'St. Louis Blues', 'STL')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Tampa Bay Lightning', 'TBL')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Toronto Maple Leafs', 'TOR')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Vancouver Canucks', 'VAN')")
    dbCursor.execute("INSERT INTO TEAMS VALUES (null, 'Winnipeg Jets', 'WPG')")
    
    print 'Adding seasons to the database...'
    
    dbCursor.execute("INSERT INTO SEASONS VALUES (null, '2011-2012')")
    
    dbConnection.commit()          
    dbConnection.close()
    print 'Done'
    
if __name__ == "__main__":
    dbInit()