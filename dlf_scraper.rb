require "mechanize"

Plyr = Struct.new(:first_name, :last_name, :age, :position, :team, :rookie?)

class DlfScraper

  attr_reader :players

  def initialize
    @players = []
    @agent = Mechanize.new
  end

  def scrape(url, n)
    page = agent.get(url)
    results = page.search("td[@class='ranks']")
    next_up = 0
    count = 1
    until count > n
      p_info = []
      5.times do
        break if results[next_up].nil?
        p_info << results[next_up].text
        next_up += 1
      end
      @plyrs << DLFPlayer.new(p_info[0], p_info[1], p_info[2], p_info[3], p_info[4])
      next_up += 6
      count += 1
    end

end