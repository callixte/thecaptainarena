class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def show
    @weapon = Weapon.find(params[:id])
  end

  def new
    @weapon = Weapon.new
  end

  def edit
    @weapon = Weapon.find(params[:id])
  end

  def create
    @weapon = Weapon.new(weapon_params)

    if @weapon.save
      redirect_to @weapon
    else
      render 'new'
    end
  end

  def update
    @weapon = Weapon.find(params[:id])

    if @weapon.update(weapon_params)
      redirect_to @weapon
    else
      render 'edit'
    end
  end

  def destroy
    @weapon = Weapon.find(params[:id])
    @weapon.destroy

    redirect_to weapons_path
  end

  private

  def weapon_params
    params.require(:weapon)
      .permit(:name, :attack, :defence)
  end
end
