class SearchController < ApplicationController

  def calculator
    @player_names = []
    Player.all.each do |player|
      @player_names << player.name
    end

    @top_player = Month.last.dlf_ranks.first.player
    wr = Player.where(:position => 1)
    rb = Player.where(:position => 2)
    qb = Player.where(:position => 3)
    te = Player.where(:position => 4)

    @top_wr = wr[0]
    wr.each do |player|
      @top_wr = player if player.dlf_ranks.last.rank < @top_wr.dlf_ranks.last.rank
    end

    @top_rb = rb[0]
    rb.each do |player|
      @top_rb = player if player.dlf_ranks.last.rank < @top_rb.dlf_ranks.last.rank
    end

    @top_qb = qb[0]
    qb.each do |player|
      @top_qb = player if player.dlf_ranks.last.rank < @top_qb.dlf_ranks.last.rank
    end

    @top_te = te[0]
    te.each do |player|
      @top_te = player if player.dlf_ranks.last.rank < @top_te.dlf_ranks.last.rank
    end

    @top_150 = []
    Player.all.each do |player|
      @top_150 << [player.full_name, player.dlf_trend_3_months, player.dlf_ranks.last.rank] if player.dlf_ranks.last.rank < 101
    end

    @top_150 = @top_150.sort_by{|x,y|y}


  end

  def results
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

    @t1_gained = @t2_sending_value - @t1_sending_value
    @t2_gained = @t1_sending_value - @t2_sending_value

    exchanged = @t1_gained.abs
    rank = 1
    initial = 3000

    vals = Player.values
    best = ["No Match found", 5000]
    vals.each do |p|
      best = p if ((exchanged - p[1]).abs) < ((exchanged - best[1]).abs)
      p best
    end

    @best_match = best
  end

end