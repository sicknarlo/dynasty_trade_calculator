class Player < ActiveRecord::Base
  has_many :dlf_ranks, dependent: :destroy
  belongs_to :position, foreign_key: :position_id
  has_one :team
  has_many :redraft_ranks, dependent: :destroy

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def latest_redraft_rank
    redraft_ranks.last.rank unless redraft_ranks.last.nil?
  end

  def redraft_difference
    latest_redraft_rank - latest_rank unless redraft_ranks.last.nil?
  end

  def best_rank
    b = [10000, nil]
    dlf_ranks.each do |r|
      if r.rank < b[0]
        b = [r.rank, "#{r.month.mon} #{r.month.year}"]
      end
    end
    b
  end

  def similar_players
    similar_players = []
      five_lower_players = Month.last.dlf_ranks.where("rank < #{self.latest_rank} AND rank >= #{self.latest_rank - 5}")
      five_higher_players = Month.last.dlf_ranks.where("rank > #{self.latest_rank} AND rank <= #{self.latest_rank + 5}")

      five_lower_players.each do |p|
        similar_players << p.player
      end

      similar_players << player

      five_higher_players.each do |p|
        similar_players << p.player
      end
      similar_players
  end

  def worst_rank
    b = [-1, nil]
    dlf_ranks.each do |r|
      if r.rank > b[0]
        b = [r.rank, "#{r.month.mon} #{r.month.year}"]
      end
    end
    b
  end

  def dlf_last_3_months
    dlf_ranks.order(:month_id => :desc).limit(3)
  end

  def dlf_avg_last_3_months
    ranks = self.dlf_last_3_months
    avg = 0
    ranks.each do |p|
      avg += p.rank
    end
    (avg / 3.0).round(2)
  end

  def dlf_trend_3_months
    ranks = self.dlf_last_3_months
    if ranks.length == 1
      ranks.first.rank
    elsif ranks.length == 2
      ranks[1].rank - ranks[0].rank
    else
      ranks[2].rank - ranks[0].rank unless ranks[2].rank.nil? || ranks[0].rank.nil?
    end
  end

  def latest_rank
    self.dlf_ranks.last.rank
  end

  def dlf_trends
    player_trends = {}
    Player.all.each do |player|
      if player.dlf_ranks
      trend = player.dlf_ranks[-3].rank - dlf_ranks[-1].rank
      player_trends[player.id] = trend
    end
    end
    player_trend
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def stripped_name
  # Returns a string of the first name and last name combined and
  # with all punctuaion removed to search the DB and account for
  # some variations in spelling
  "#{self.first_name}#{self.last_name}".upcase.gsub(" JR", "")
                                              .gsub(" SR", "")
                                              .gsub(" ", "")
                                              .gsub("-", "")
                                              .gsub(".", "")
                                              .gsub("'", "")
  end

  # def value
  #   val = 3000
  #   count = 1
  #   if self.latest_rank == 1
  #     return val
  #   else
  #     self.latest_rank.times do
  #       if count > 5
  #         val *= 0.99
  #         count += 1
  #       elsif count > 10
  #         val *= 0.98
  #         count += 1
  #       elsif count > 15
  #         val *= 0.97
  #         count += 1
  #       elsif count > 20
  #         val *= 0.96
  #         count += 1
  #       elsif count > 25
  #         val *= 0.95
  #         count += 1
  #       else
  #         val *= 0.94
  #         count += 1
  #       end
  #     end
  #   end
  #   val.to_i
  # end

  def value
    val = 10000
    count = 1
    if self.latest_rank == 1
      return val
    else
      self.latest_rank.times do
        val *= 0.97
      end
    end
    # val.to_i
    val.round(2)
  end

  def self.values
    vals = []
    Player.all.each do |player|
      vals << [player, player.value, player.latest_rank]
    end
    vals
  end

  def self.median_value
    vals = Player.values
    vals = vals.sort_by{|x,y,z| y}
    len = vals.length
    return (vals[(len - 1) / 2][1] + vals[len / 2][1]) / 2.0
  end

  def strip_name(n)
  # Returns a string of the first name and last name combined and
  # with all punctuaion removed to search the DB and account for
  # some variations in spelling
    n.upcase.gsub(" JR", "")
            .gsub(" SR", "")
            .gsub(" ", "")
            .gsub("-", "")
            .gsub(".", "")
            .gsub("'", "")
  end
end
