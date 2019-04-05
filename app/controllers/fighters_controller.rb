class FightersController < ApplicationController
  def index
    @fighters = Fighter.all
  end

  def show
    @fighter = Fighter.find(params[:id])
  end

  def new
    @fighter = Fighter.new
  end

  def edit
    @fighter = Fighter.find(params[:id])
  end

  def create
    @fighter = Fighter.new(fighter_params)

    if @fighter.save
      redirect_to @fighter
    else
      render 'new'
    end
  end

  def update
    @fighter = Fighter.find(params[:id])

    if @fighter.update(fighter_params)
      redirect_to @fighter
    else
      render 'edit'
    end
  end

  def destroy
    @fighter = Fighter.find(params[:id])
    @fighter.destroy

    redirect_to fighters_path
  end

  private

  def fighter_params
    params.require(:fighter)
      .permit(:name, :life_points, :attack_points, :dexterity)
  end
end
