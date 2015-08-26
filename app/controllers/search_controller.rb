class SearchController < ApplicationController

  def calculator
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
          render :calculator
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
          render :calculator
        else
          @t2 << p
          @t2_sending_value += p.value
        end
      end
    end

    @t1_gained = @t2_sending_value - @t1_sending_value
    @t2_gained = @t1_sending_value - @t2_sending_value

  end

end