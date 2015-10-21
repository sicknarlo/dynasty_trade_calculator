  # 2016 1st
base_1st = 48
base_2nd = 118
base_3rd = 170
base_4th = 239
multiplier = 1.33
max = 340

player = Player.create(
                        first_name: "2016",
                         last_name: "1st",
                       position_id: "7",
                           rookie?: true,
                           active?: true,
                     stripped_name: "20161ST",
                              name: "2016 1st")

Month.all.each do |m|
  player.dlf_ranks.create(
                        month_id: m.id,
                        rank: base_1st)
end

# Future 2nd
player = Player.create(
                        first_name: "2016",
                         last_name: "2nd",
                       position_id: "7",
                           rookie?: true,
                           active?: true,
                     stripped_name: "20162ND",
                              name: "2016 2nd")

Month.all.each do |m|
  player.dlf_ranks.create(
                        month_id: m.id,
                        rank: base_2nd)
end

# 2017 3rd
player = Player.create(
                        first_name: "2016",
                         last_name: "3rd",
                       position_id: "7",
                           rookie?: true,
                           active?: true,
                     stripped_name: "20163RD",
                              name: "2016 3rd")

Month.all.each do |m|
  player.dlf_ranks.create(
                        month_id: m.id,
                        rank: base_3rd)
end



# 2016 4th
player = Player.create(
                        first_name: "2016",
                         last_name: "4th",
                       position_id: "7",
                           rookie?: true,
                           active?: true,
                     stripped_name: "20164TH",
                              name: "2016 4th")

Month.all.each do |m|
  player.dlf_ranks.create(
                        month_id: m.id,
                        rank: base_4th)
end

#------------------------------------------------------------

# 2017 1st
player = Player.create(
                        first_name: "2017",
                         last_name: "1st",
                       position_id: "7",
                           rookie?: true,
                           active?: true,
                     stripped_name: "20171ST",
                              name: "2017 1st")

Month.all.each do |m|
  player.dlf_ranks.create(
                        month_id: m.id,
                        rank: base_1st * multiplier)
end

# Future 2nd
player = Player.create(
                        first_name: "2017",
                         last_name: "2nd",
                       position_id: "7",
                           rookie?: true,
                           active?: true,
                     stripped_name: "20172ND",
                              name: "2017 2nd")

Month.all.each do |m|
  player.dlf_ranks.create(
                        month_id: m.id,
                        rank: base_2nd * multiplier)
end

# 2017 3rd
player = Player.create(
                        first_name: "2017",
                         last_name: "3rd",
                       position_id: "7",
                           rookie?: true,
                           active?: true,
                     stripped_name: "20173RD",
                              name: "2017 3rd")

Month.all.each do |m|
  player.dlf_ranks.create(
                        month_id: m.id,
                        rank: base_3rd * multiplier)
end

# 2017 4th
player = Player.create(
                        first_name: "2017",
                         last_name: "4th",
                       position_id: "7",
                           rookie?: true,
                           active?: true,
                     stripped_name: "20174TH",
                              name: "2017 4th")

Month.all.each do |m|
  player.dlf_ranks.create(
                        month_id: m.id,
                        rank: max)
end

#-----------------------------------------------------

# 2018 1st
player = Player.create(
                        first_name: "2018",
                         last_name: "1st",
                       position_id: "7",
                           rookie?: true,
                           active?: true,
                     stripped_name: "20181ST",
                              name: "2018 1st")

Month.all.each do |m|
  player.dlf_ranks.create(
                        month_id: m.id,
                        rank: base_1st * 1.66)
end

# Future 2nd
player = Player.create(
                        first_name: "2018",
                         last_name: "2nd",
                       position_id: "7",
                           rookie?: true,
                           active?: true,
                     stripped_name: "20182ND",
                              name: "2018 2nd")

Month.all.each do |m|
  player.dlf_ranks.create(
                        month_id: m.id,
                        rank: base_2nd * 1.66)
end

# 2018 3rd
player = Player.create(
                        first_name: "2018",
                         last_name: "3rd",
                       position_id: "7",
                           rookie?: true,
                           active?: true,
                     stripped_name: "20183RD",
                              name: "2018 3rd")

Month.all.each do |m|
  player.dlf_ranks.create(
                        month_id: m.id,
                        rank: base_3rd * 1.66)
end

# 2018 4th
player = Player.create(
                        first_name: "2018",
                         last_name: "4th",
                       position_id: "7",
                           rookie?: true,
                           active?: true,
                     stripped_name: "20184TH",
                              name: "2018 4th")

Month.all.each do |m|
  player.dlf_ranks.create(
                        month_id: m.id,
                        rank: max)
end