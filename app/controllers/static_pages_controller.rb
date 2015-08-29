class StaticPagesController < ApplicationController

  def landing

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
end
