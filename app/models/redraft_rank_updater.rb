require 'csv'

class RedraftRanker

  def run(file, month_id)

    CSV.foreach("../dynasty_trade_calculator/#{file}") do |row|
      stripped_name = row[1].upcase.gsub(" JR", "")
                                   .gsub(" SR", "")
                                   .gsub(" ", "")
                                   .gsub("-", "")
                                   .gsub(".", "")
                                   .gsub("'", "")
      player = Player.where(:stripped_name => stripped_name).first
      month = Month.find(month_id)
      RedraftRank.create(:player_id => player.id, :month_id => month.id, :rank => row[0]) unless player.nil?
    end
  end

end