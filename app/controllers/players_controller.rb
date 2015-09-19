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

    @player_data = []
    @player.dlf_ranks.each do |dlf|
      @player_data << [dlf.rank, dlf.month.mon + " " + dlf.month.year.to_s]
    end

    respond_to do |format|

      # Renders the usual `index.html.erb` template
      format.html

      # Send back a specific collection, so no template
      #   needed
      format.json { render json: @player_data }

    end
  end

end