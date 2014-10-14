require_relative "../ntoidatamapper.rb"

season = Season.first(:seasonID => "20142015")

az_yotes = Team.create(:name => "Arizona Coyotes", :teamID => "ARI", :division => Division.first(:name => "Pacific"))
az_yotes.seasons << season
az_yotes.save

phx_yotes = Team.first(:teamID => "PHX")
phx_yotes.seasons.delete(season)
phx_yotes.save
