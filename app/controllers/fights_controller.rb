class FightsController < ApplicationController
  def select
    @fighter1 = Fighter.find(params[:id]) if params[:id]
    @fighters = Fighter.all
  end

  def go
    @fighter1 = Fighter.find(params[:id1])
    @fighter2 = Fighter.find(params[:id2])
    @fight = Fight.start(@fighter1, @fighter2)
  end
end
