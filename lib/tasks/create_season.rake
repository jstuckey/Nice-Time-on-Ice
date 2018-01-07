desc "Create new season in the database"
task :create_season, [:season] => :environment do |_t, args|
  year_start = if args[:season].present?
                 args[:season].to_i
               else
                 Time.current.year
               end

  season = Season.create(year_start: year_start, year_end: year_start + 1)

  team_ids = Team.pluck(:id)
  team_ids.each do |tid|
    SeasonTeam.create(season_id: season.id, team_id: tid)
  end
  puts "Created season for #{year_start}#{year_start + 1}"
end
