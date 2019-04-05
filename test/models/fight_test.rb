require 'test_helper'

class FightTest < ActiveSupport::TestCase
  def setup
    @f1 = fighters(:one)
    @f2 = fighters(:two)
  end

  test '.strike when fighter misses' do
    rdm = Minitest::Mock.new
    rdm.expect :rand, 78, [100]
    rdm.expect :rand, 3, [5]

    d, s = Fight.strike(@f1, @f2, rdm)
    assert d == 0
    assert s == 'Joe the Conqueror tente un coup de genou et rate'
  end

  test '.strike when fighter succeeds' do
    rdm = Minitest::Mock.new
    rdm.expect :rand, 34, [100]
    rdm.expect :rand, 1, [5]

    d, s = Fight.strike(@f1, @f2, rdm)
    assert d == 11
    assert s == 'Joe the Conqueror donne un coup de pied'
  end

  test '.save_fight when @f1 wins' do
    f = Fight.save_fight(12, @f1, @f2, "some summary")
    assert f.winner == @f1
    assert f.loser == @f2
    assert f.persisted?
  end

  test '.save_fight when @f2 wins' do
    f = Fight.save_fight(-12, @f1, @f2, "some summary")
    assert f.winner == @f2
    assert f.loser == @f1
    assert f.persisted?
  end
end
