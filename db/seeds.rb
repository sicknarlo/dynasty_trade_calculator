# Initial position add

# WR
Position.create(:name => "Wide Receiver", :abbr => "WR")

# RB
Position.create(:name => "Running Back", :abbr => "RB")

# QB
Position.create(:name => "Quarterback", :abbr => "QB")

# TE
Position.create(:name => "Tight End", :abbr => "TE")

# K
Position.create(:name => "Kicker", :abbr => "K")

# RDP
Position.create(:name => "Rookie Draft Pick", :abbr => "RDP")

# FDP
Position.create(:name => "Future Draft Pick", :abbr => "FDP")

# MLB
Position.create(:name => "Middle Linebacker", :abbr => "MLB")

# OLB
Position.create(:name => "Outside Linebacker", :abbr => "OLB")

# DT
Position.create(:name => "Defensive Tackle", :abbr => "DT")

# DE
Position.create(:name => "Defensive End", :abbr => "DE")

# CB
Position.create(:name => "Cornerback", :abbr => "CB")

# S
Position.create(:name => "Safety", :abbr => "S")

########################################################################

# Initial Team Add

teams = [
          ["Arizona Cardinals","ARI"],
          ["Atlanta Falcons","ATL"],
          ["Baltimore Ravensz","BAL"],
          ["Buffalo Bills","BUF"],
          ["Carolina Panthers","CAR"],
          ["Chicago Bears","CHI"],
          ["Cincinnati Bengals","CIN"],
          ["Cleveland Browns","CLE"],
          ["Dallas Cowboys","DAL"],
          ["Denver Broncos","DEN"],
          ["Detroit Lions","DET"],
          ["Green Bay Packers","GB"],
          ["Houston Texans","HOU"],
          ["Indianapolis Colts","IND"],
          ["Jacksonville Jaguars","JAX"],
          ["Kansas City Chiefs","KC"],
          ["Miami Dolphins","MIA"],
          ["Minnesota Vikings","MIN"],
          ["New England Patriots","NE"],
          ["New Orleans Saints","NO"],
          ["NY Giants","NYG"],
          ["NY Jets","NYJ"],
          ["Oakland Raiders","OAK"],
          ["Philadelphia Eagles","PHI"],
          ["Pittsburgh Steelers","PIT"],
          ["San Diego Chargers","SD"],
          ["San Francisco 49ers","SF"],
          ["Seattle Seahawks","SEA"],
          ["St. Louis Rams","STL"],
          ["Tampa Bay Buccaneers","TB"],
          ["Tennessee Titans","TEN"],
          ["Washington Redskins","WSH"]
        ]

teams.each do |t|
  Team.create(:name => t[0], :abbr => t[1])
end

########################################################################

# Add month

# May 2015
Month.create(:mon => "January", :year => 2015, :month_index => 115)

# June 2015
Month.create(:mon => "February", :year => 2015, :month_index => 215)

# July 2015
Month.create(:mon => "March", :year => 2015, :month_index => 315)

# May 2015
Month.create(:mon => "April", :year => 2015, :month_index => 415)

# June 2015
Month.create(:mon => "May", :year => 2015, :month_index => 515)

# July 2015
Month.create(:mon => "June", :year => 2015, :month_index => 615)

#July 2015
Month.create(:mon => "July", :year => 2015, :month_index => 715)

#July 2015
Month.create(:mon => "August", :year => 2015, :month_index => 815)

Month.create(:mon => "September", :year => 2015, :month_index => 915)

Month.create(:mon => "October", :year => 2015, :month_index =>1015)

########################################################################


# # Initial player add from DLF scrape
# require 'mechanize'

# # # Player struct to store player information for upload to db
# require 'csv'

# rookies = []
# CSV.foreach("../dynasty_trade_calculator/db/rookies.csv") do |row|
#   p = row[0].upcase.gsub(" JR", "")
#                    .gsub(" SR", "")
#                    .gsub(" ", "")
#                    .gsub("-", "")
#                    .gsub(".", "")
#                    .gsub("'", "")
#   rookies << p
# end

# agent = Mechanize.new
# page = agent.get("http://dynastyleaguefootball.com/adpdata/2015-adp/?month=5")
# results = page.search("td[@class='ranks']")
# next_up = 0
# count = 1
# until count > 270
#   p = []
#   results[next_up..next_up+10].each do |e|
#     p << e.text
#   end
#   p_pos = p[1]
#   p_name = p[2].gsub(".", "").gsub("'", "").gsub(" Jr", "").gsub(" Sr", "").split(" ")
#   p_fname = p_name[0]
#   p_lname = p_name[1]
#   p_search_name = "#{p_fname}#{p_lname}".upcase.gsub(" JR", "")
#                                             .gsub(" SR", "")
#                                             .gsub(" ", "")
#                                             .gsub("-", "")
#                                             .gsub(".", "")
#                                             .gsub("'", "")
#   if rookies.include?(p_search_name)
#     p_rookie = true
#   else
#     p_rookie = false
#   end
#   p_pos = Position.where(:abbr => p[1])
#                   .first
#                   .id
#   n = Player.new(:first_name => p_fname,
#                  :last_name => p_lname,
#                  :age => p[3].to_i,
#                  :position_id => p_pos.to_i,
#                  :stripped_name => p_search_name,
#                  :rookie? => p_rookie,
#                  :active? => true
#                 )
#   n.save if Player.where(:first_name => p_fname, :last_name => p_lname).empty?
#   p "Success!"
#   next_up += 11
#   count += 1
# end

# #######################################################################

