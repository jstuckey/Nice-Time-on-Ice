json.array! teams do |team|
  json.partial! "team", team: team
end
