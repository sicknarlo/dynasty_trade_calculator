class PlayersController < ApplicationController


  def index
    if params[:search]
      @player = Player.search(params[:search]).first
      @similar_players = []
      five_lower_players = Month.last.dlf_ranks.where("rank < #{@player.latest_rank} AND rank >= #{@player.latest_rank - 5}")
      five_higher_players = Month.last.dlf_ranks.where("rank > #{@player.latest_rank} AND rank <= #{@player.latest_rank + 5}")

      five_lower_players.each do |p|
        @similar_players << p.player
      end

      @similar_players << @player

      five_higher_players.each do |p|
        @similar_players << p.player
      end
    end
  end

  def database
    @players = Player.all.to_a.sort_by(&:latest_rank)
  end

  def show
    @player = Player.find(params[:id])
    @similar_players = []
      five_lower_players = Month.last.dlf_ranks.where("rank < #{@player.latest_rank} AND rank >= #{@player.latest_rank - 5}")
      five_higher_players = Month.last.dlf_ranks.where("rank > #{@player.latest_rank} AND rank <= #{@player.latest_rank + 5}")

      five_lower_players.each do |p|
        @similar_players << p.player
      end

      @similar_players << @player

      five_higher_players.each do |p|
        @similar_players << p.player
      end
  end

end