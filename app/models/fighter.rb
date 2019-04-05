class Fighter < ApplicationRecord
  has_many :won_fights, class_name: 'Fight', foreign_key: 'winner_id'
  has_many :lost_fights, class_name: 'Fight', foreign_key: 'loser_id'

  validates :name, presence: true
  validates :life_points, numericality:
    { only_integer: true, less_than_or_equal_to: 100}
  validates :attack_points, numericality: 
    { only_integer: true, less_than_or_equal_to: 100}
end
