require 'rubygems'
require 'data_mapper'

# This script can be called from the project root or the bin folder (./bin)
# We always want the database to be created in the project root
if Dir.pwd.include? "/bin"
  dbPath = File.expand_path("..", Dir.pwd)
else
  dbPath = Dir.pwd 
end

DataMapper::setup(:default, ENV['SHARED_DATABASE_URL'] || "sqlite3://#{dbPath}/toi.db")

class Conference
  include DataMapper::Resource
  property :dmID, Serial
  property :name, Text
  
  has n, :divisions
end

class Division
  include DataMapper::Resource
  property :dmID, Serial
  property :name, Text
  
  belongs_to :conference
  has n, :teams
end

class Team
  include DataMapper::Resource
  property :dmID, Serial
  property :teamID, Text
  property :name, Text
  
  belongs_to :division
  has n, :seasons, :through => Resource
end

class Season
  include DataMapper::Resource
  property :dmID, Serial
  property :seasonID, Text
  
  has n, :games
end

class Game
  include DataMapper::Resource
  property :dmID, Serial
  property :gameID, Text
  property :date, Text
  property :gameType, Text
  
  belongs_to :season
  
  belongs_to :awayTeam, :model => Team
  belongs_to :homeTeam, :model => Team
  # has 1, :awayTeam, 'Team', :through => Resource
  # has 1, :homeTeam, 'Team', :through => Resource
end
  
DataMapper.finalize.auto_upgrade!
