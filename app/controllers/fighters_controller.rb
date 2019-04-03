class FightersController < ApplicationController
  def index
    @fighters = Fighter.all
  end

  def show
    @fighter = Fighter.find(params[:id])
  end

  def new
  end

  def create
    @fighter = Fighter.new(fighter_params)

    @fighter.save
    redirect_to @fighter
  end

  private

  def fighter_params
    params.require(:fighter).permit(:name, :life_points, :attack_points)
  end
end
