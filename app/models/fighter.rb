class Fighter < ApplicationRecord
  WEAPONS = %w[tête pied poing genou coude].freeze

  has_many :won_fights, class_name: 'Fight', foreign_key: 'winner_id'
  has_many :lost_fights, class_name: 'Fight', foreign_key: 'loser_id'

  validates_with FightersHelper::FighterValidator

  attr_accessor :weapon1
  attr_accessor :weapon2

  def weapon_used(rdm)
    unless @weapons
      @weapons = []
      @weapons += [weapon1] * weapon1.attack if weapon1&.attack&.positive?
      # weapon1 a d'autant plus de chance d'être choisie que le bonus est fort
      @weapons += [weapon2] * weapon2.attack if weapon2&.attack&.positive?
      @weapons += WEAPONS
    end
    weapon = @weapons[rdm.rand(@weapons.size)]
    if weapon.is_a?(Weapon)
      [weapon.name, weapon.attack]
    else
      [weapon, 0]
    end
  end

  def defence_bonus(rdm)
    unless @defences
      @defences = []
      @defences << weapon1 if weapon1&.defence&.positive?
      @defences << weapon2 if weapon2&.defence&.positive?
    end
    if @defences.size.zero?
      0
    else
      defence = @defences[rdm.rand(@defences.size)]
      defence.defence
    end
  end
end
