class SearchController < ApplicationController

  def calculator
    @player_names = []
    Player.all.each do |player|
      @player_names << player.name
    end

  end

  def results

    @player_names = []
    Player.all.each do |player|
      @player_names << player.name
    end

    team1 = [params[:t1p1], params[:t1p2], params[:t1p3],
                            params[:t1p4], params[:t1p5]]
    team2 = [params[:t2p1], params[:t2p2], params[:t2p3],
                            params[:t2p4], params[:t2p5]]
    @t1 = []
    @t1_sending_value = 0
    team1.each do |player|
      unless player == ""
        p_stripped = player.upcase.gsub(" JR", "")
                                  .gsub(" SR", "")
                                  .gsub(" ", "")
                                  .gsub("-", "")
                                  .gsub(".", "")
                                  .gsub("'", "")
        p = Player.find_by_stripped_name(p_stripped)
        if p.nil?
          flash[:error] = "Could not find '#{player}', check your entries and try again"
        else
          @t1 << p
          @t1_sending_value += p.value
        end
      end
    end

    @t2 = []
    @t2_sending_value = 0
    team2.each do |player|
      unless player == ""
        p_stripped = player.upcase.gsub(" JR", "")
                                  .gsub(" SR", "")
                                  .gsub(" ", "")
                                  .gsub("-", "")
                                  .gsub(".", "")
                                  .gsub("'", "")
        p = Player.find_by_stripped_name(p_stripped)
        if p.nil?
          flash[:error] = "Could not find '#{player}', check your entries and try again"
        else
          @t2 << p
          @t2_sending_value += p.value
        end
      end
    end

    @t1_gained = (@t2_sending_value - @t1_sending_value).round(2)
    @t2_gained = (@t1_sending_value - @t2_sending_value).round(2)
    @dtmScore = ([@t1_sending_value, @t2_sending_value].min.to_f / [@t1_sending_value, @t2_sending_value].max).round(2)

    @exchanged = @t1_gained.abs
    rank = 1
    initial = 10000

    vals = Player.values
    best = ["No Match found", 12000, nil]
    vals.each do |p|
      best = p if (((@exchanged - p[1]).abs) < ((@exchanged - best[1]).abs)) && !@t1.include?(p[0]) && !@t2.include?(p[0])
      p best
    end

    @best_match = best
  end

  def player
    @player = Player.where(:name => params[:nameSearch])
  end

end