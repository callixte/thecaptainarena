class Fight < ApplicationRecord
  belongs_to :winner, class_name: 'Fighter'
  belongs_to :loser, class_name: 'Fighter'

  def summary_ex
    summary.split('+')
  end

  class << self
    def start(fighter1, fighter2)
      life1 = fighter1.life_points
      life2 = fighter2.life_points
      the_tale = ''
      while life1.positive? && life2.positive?
        damage1, damage2, summary = round(fighter1, fighter2)
        life1 -= damage2
        life2 -= damage1
        the_tale += summary + '+'
      end

      save_fight(life1, fighter1, fighter2, the_tale)
    end

    def round(fighter1, fighter2)
      rdm = Random.new
      d1, s1 = strike(fighter1, fighter2, rdm)
      d2, s2 = strike(fighter2, fighter1, rdm)
      s =
        if d1 > d2
          s1 + ' et ' + s2 + '.'
        else
          s2 + ' et ' + s1 + '.'
        end
      [d1, d2, s]
    end

    def strike(fighter1, fighter2, rdm)
      if attack_capability(fighter1.dexterity, fighter2.dexterity) > rdm.rand(100)
        # fighter1 porte un coup
        wpn, d = fighter1.weapon_used(rdm)
        d += fighter1.attack_points / 5
        s = "#{fighter1.name} donne un coup de #{wpn}"
      else
        wpn, = fighter1.weapon_used(rdm)
        d = 0
        s = "#{fighter1.name} tente un coup de #{wpn} et rate"
      end
      d = [0, d - fighter2.defence_bonus(rdm)].max
      [d, s]
    end

    def save_fight(life1, fighter1, fighter2, summary)
      fight = Fight.new
      if life1 <= 0
        fight.loser = fighter1
        fight.winner = fighter2
      else
        fight.loser = fighter2
        fight.winner = fighter1
      end
      fight.summary = summary
      fight.save
      fight
    end

    def attack_capability(d1, d2) # capacité d'attaque: dextérité du premier
      # diminuée par dextérité du deuxième (représente la capacité à esquiver)
      (d1 + 100 - d2) / 2
    end
  end
end
