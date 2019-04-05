require 'test_helper'

class FighterTest < ActiveSupport::TestCase
  test 'valid fighter' do
    fighter = Fighter.new(name: 'Reginald le Brave', life_points: 23, attack_points: 45)
    assert fighter.valid?
  end

  test 'invalid without name' do
    fighter = Fighter.new(life_points: 23, attack_points: 45)
    refute fighter.valid?, 'fighter is valid without a name'
    assert_not_nil fighter.errors[:name], 'no validation error for name present'
  end

  test 'invalid with life_points greater than 100' do
    fighter = Fighter.new(name: 'Reginald le Brave', life_points: 102, attack_points: 45)
    refute fighter.valid?, 'fighter is valid withlife_points > 100'
    assert_not_nil fighter.errors[:life_points], 'no validation error for life_points present'
  end

  test 'invalid with life_points not integer' do
    fighter = Fighter.new(name: 'Reginald le Brave', life_points: 10.4, attack_points: 45)
    refute fighter.valid?, 'fighter is valid withlife_points not integer'
    assert_not_nil fighter.errors[:life_points], 'no validation error for life_points present'
  end

  test 'invalid with attack_points greater than 100' do
    fighter = Fighter.new(name: 'Reginald le Brave', life_points: 10, attack_points: 145)
    refute fighter.valid?, 'fighter is valid with attack_points > 100'
    assert_not_nil fighter.errors[:attack_points], 'no validation error for attack_points present'
  end

  test 'invalid with attack_points not integer' do
    fighter = Fighter.new(name: 'Reginald le Brave', life_points: 34, attack_points: 45.34)
    refute fighter.valid?, 'fighter is valid with attack_points not integer'
    assert_not_nil fighter.errors[:attack_points], 'no validation error for attack_points present'
  end
end
