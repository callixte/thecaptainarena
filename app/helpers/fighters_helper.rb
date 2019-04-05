# frozen_string_literal: true

module FightersHelper
  class FighterValidator < ActiveModel::Validator
    def validate(record)
      if record.name.blank?
        record.errors[:base] << "Le combattant doit avoir un nom"
      end
      if record.life_points > 100
        record.errors[:base] << "Les points de vie doivent être inférieurs à 100"
      end
      if record.attack_points > 100
        record.errors[:base] << "La force doit être inférieure à 100"
      end
      if record.dexterity > 100
        record.errors[:base] << "La dextérité doit être entière et inférieure à 100"
      end
      if record.life_points + record.attack_points + record.dexterity > 250
        record.errors[:base] << "La somme doit être inférieure à 250"
      end
    end
  end
end
