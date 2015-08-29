all_picks = Player.where(:first_name => "Pick")
picks = []
n = 1
all_picks.each do |pick|
  p pick.last_name.to_i % 7
  if pick.last_name.to_i % 7 == 0
    picks << [pick, n]
    n += 1
  end
end
picks
