require 'rubygems'
require 'data_mapper'

# This script can be called from the project root or the data folder (./data)
# We always want the SQLite database to be created in the project root
if Dir.pwd.include? "/data"
  dbPath = File.expand_path("..", Dir.pwd)
else
  dbPath = Dir.pwd 
end

DataMapper::setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{dbPath}/toi.db") # "postgres://postgres@localhost/nicetimeonice"

class Conference
  include DataMapper::Resource
  property :dmID, Serial
  property :name, String
  
  has n, :divisions
end

class Division
  include DataMapper::Resource
  property :dmID, Serial
  property :name, String
  
  belongs_to :conference
  has n, :teams
end

class Team
  include DataMapper::Resource
  property :dmID, Serial
  property :teamID, String
  property :name, String
  
  belongs_to :division
  has n, :seasons, :through => Resource
end

class Season
  include DataMapper::Resource
  property :dmID, Serial
  property :seasonID, String
  
  has n, :games
end

class Game
  include DataMapper::Resource
  property :dmID, Serial
  property :gameID, String
  property :date, String
  property :gameType, String
  
  belongs_to :season
  
  belongs_to :awayTeam, :model => Team
  belongs_to :homeTeam, :model => Team
  # has 1, :awayTeam, 'Team', :through => Resource
  # has 1, :homeTeam, 'Team', :through => Resource
end
  
DataMapper.finalize.auto_upgrade!
