class FightsController < ApplicationController
  def select
    @fighter1 = Fighter.find(params[:id]) if params[:id]
    @fighters = Fighter.all
  end

  def weapons
    @fighter1 = Fighter.find(params[:id1])
    @fighter2 = Fighter.find(params[:id2])
    @weapons = Weapon.all
  end

  def go
    fighter1 = Fighter.find(params[:id1])
    attribute_weapon1(fighter1, :w11)
    attribute_weapon2(fighter1, :w12)
    fighter2 = Fighter.find(params[:id2])
    attribute_weapon1(fighter2, :w21)
    attribute_weapon2(fighter2, :w22)
    @fight = Fight.start(fighter1, fighter2)
  end

  def index
    @fights = Fight.all
  end

  private

  def attribute_weapon1(fighter, id)
      fighter.weapon1 = Weapon.find(params[id]) if !params[id].blank?
  end
  def attribute_weapon2(fighter, id)
      fighter.weapon2 = Weapon.find(params[id]) if !params[id].blank?
  end
end
