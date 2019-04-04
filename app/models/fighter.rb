class Fighter < ApplicationRecord
  has_many :won_fights, class_name: 'Fight', foreign_key: 'winner_id'
  has_many :lost_fights, class_name: 'Fight', foreign_key: 'loser_id' 
end
