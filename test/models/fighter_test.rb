require 'test_helper'

class FighterTest < ActiveSupport::TestCase
  test 'valid fighter' do
    fighter = Fighter.new(name: 'Reginald le Brave', life_points: 23,
      attack_points: 45, dexterity: 23)
    assert fighter.valid?
  end

  test 'invalid without name' do
    fighter = Fighter.new(life_points: 23, attack_points: 45, dexterity: 23)
    refute fighter.valid?, 'fighter is valid without a name'
  end

  test 'invalid with life_points greater than 100' do
    fighter = Fighter.new(name: 'Reginald le Brave', life_points: 102,
      attack_points: 45, dexterity: 23)
    refute fighter.valid?, 'fighter is valid withlife_points > 100'
  end

  test 'invalid with attack_points greater than 100' do
    fighter = Fighter.new(name: 'Reginald le Brave', life_points: 10,
      attack_points: 145, dexterity: 23)
    refute fighter.valid?, 'fighter is valid with attack_points > 100'
  end

  test 'invalid with dexterity greater than 100' do
    fighter = Fighter.new(name: 'Reginald le Brave', life_points: 10,
      attack_points: 45, dexterity: 123)
    refute fighter.valid?, 'fighter is valid with dexterity > 100'
  end

  test 'invalid with sum greater than 250' do
    fighter = Fighter.new(name: 'Reginald le Brave', life_points: 90,
      attack_points: 90, dexterity: 90)
    refute fighter.valid?, 'fighter is valid with sum > 250'
  end

  test 'weapon used with no weapon' do
    fighter = fighters(:one)
    rdm = Minitest::Mock.new
    rdm.expect :rand, 3, [5]
    w, d = fighter.weapon_used(rdm)
    assert d.zero?
    assert w == 'genou'
  end

  test 'weapon used with a weapon' do
    fighter = fighters(:one)
    weapon = weapons(:one)
    fighter.weapon1 = weapon
    rdm = Minitest::Mock.new
    rdm.expect :rand, 0, [15]
    w, d = fighter.weapon_used(rdm)
    assert d == 10
    assert w == 'Epée'
  end

  test 'defence_bonus with no defence' do
    fighter = fighters(:one)
    rdm = Minitest::Mock.new
    d = fighter.defence_bonus(rdm)
    assert d.zero?
  end

  test 'defence_bonus with a weapon' do
    fighter = fighters(:one)
    weapon = weapons(:two)
    fighter.weapon1 = weapon
    rdm = Minitest::Mock.new
    rdm.expect :rand, 0, [1]
    d = fighter.defence_bonus(rdm)
    assert d == 10
  end
end
