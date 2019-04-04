class Fight < ApplicationRecord
  belongs_to :winner, class_name: 'Fighter'
  belongs_to :loser, class_name: 'Fighter'

  class << self
    def start(fighter1, fighter2)
      life1 = fighter1.life_points
      life2 = fighter2.life_points
      the_tale = ''
      while (life1 > 0) && (life2 > 0)
        damage1, damage2, summary = round(fighter1, fighter2)
        life1 -= damage1
        life2 -= damage2
        the_tale += summary
      end

      save_fight(life1, fighter1, fighter2, the_tale)
    end

    def round(fighter1, fighter2)
      return 23, 27, "#{fighter1.name} donne un coup de tête et #{fighter2.name} lui renvoie un coup de pied\n"
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
  end
end
