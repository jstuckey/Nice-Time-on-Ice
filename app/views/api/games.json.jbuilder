json.array! games do |game|
  json.partial! "game", game: game
end
