require "mechanize"
require "csv"

class DlfScraper

  def initialize
    # Create agent
    @agent = Mechanize.new
  end

  def scrape_all
    scrape("http://dynastyleaguefootball.com/adpdata/2015-adp/?month=1", 259, "January", 2015)
    scrape("http://dynastyleaguefootball.com/adpdata/2015-adp/?month=2", 288, "February", 2015)
    scrape("http://dynastyleaguefootball.com/adpdata/2015-adp/?month=3", 281, "March", 2015)
    scrape("http://dynastyleaguefootball.com/adpdata/2015-adp/?month=4", 280, "April", 2015)
    scrape("http://dynastyleaguefootball.com/adpdata/2015-adp/?month=5", 270, "May", 2015)
    scrape("http://dynastyleaguefootball.com/adpdata/2015-adp/?month=6", 262, "June", 2015)
    scrape("http://dynastyleaguefootball.com/adpdata/2015-adp/?month=7", 264, "July", 2015)
    scrape("http://dynastyleaguefootball.com/adpdata/2015-adp/?month=8", 264, "August", 2015)
  end



  def scrape(url, n, month, year)
    # Grab results URL
    page = @agent.get(url)
    results = page.search("td[@class='ranks']")
    rookies = []

    CSV.foreach("../dynasty_trade_calculator/db/rookies.csv") do |row|
      p = row[0].upcase.gsub(" JR", "")
                       .gsub(" SR", "")
                       .gsub(" ", "")
                       .gsub("-", "")
                       .gsub(".", "")
                       .gsub("'", "")
      rookies << p
    end

    next_up = 0
    count = 1
    r_count = 1
    until count > n
      p = []
      results[next_up..next_up+10].each do |e|
        p << e.text
      end
      p_rank = p[0]
      p_pos = p[1]
      p_name = p[2].gsub(".", "").gsub("'", "").gsub(" Jr", "").gsub(" Sr", "").split(" ")
      p_fname = p_name[0]
      p_lname = p_name[1]
      p_age = p[3].to_i
      p_search_name = strip_name(p_fname, p_lname)
      p_month = Month.where(:mon => month, :year => year)
                       .first
                       .id
      if Player.where(:stripped_name => p_search_name).blank?
        p "Creating #{p_name}!"
        p_pos = Position.where(:abbr => p[1])
                        .first
                        .id
        if rookies.include?(p_search_name)
          p_rookie = true
        else
          p_rookie = false
        end

       newp = Player.create(:first_name => p_fname,
                            :last_name => p_lname,
                            :age => p[3].to_i,
                            :position_id => p_pos.to_i,
                            :stripped_name => p_search_name,
                            :rookie? => p_rookie,
                            :active? => true
                            )
        p_id = newp.id


        DlfRank.create(:player_id => p_id, :month_id => p_month, :rank => p_rank)
      else
        p "Creating new rank for #{p_fname} #{p_lname}!"
        p_id = Player.where(:stripped_name => p_search_name)
                     .first
                     .id
        Player.find(p_id).age = p_age if p_age != Player.find(p_id).age
        p_month = Month.where(:mon => month, :year => year)
                       .first
                       .id
        if rookies.include?(p_search_name)
          p_rookie = true
        else
          p_rookie = false
        end
        DlfRank.create(:player_id => p_id, :month_id => p_month, :rank => p_rank)
      end
      next_up += 11
      count += 1
    end

    # Fill in ranks for those not ranked
    Player.all.each do |player|
      if player.dlf_ranks.where(:month_id => p_month).empty?
        DlfRank.create(:player_id => player.id, :month_id => p_month, :rank => n + 10)
      end
    end
  end
end

def strip_name(first_name, last_name)
  # Returns a string of the first name and last name combined and
  # with all punctuaion removed to search the DB and account for
  # some variations in spelling
  "#{first_name}#{last_name}".upcase.gsub(" JR", "")
                                    .gsub(" SR", "")
                                    .gsub(" ", "")
                                    .gsub("-", "")
                                    .gsub(".", "")
                                    .gsub("'", "")
end
