require 'test_helper'

class FightTest < ActiveSupport::TestCase
  def setup
    @f1 = fighters(:one)
    @f2 = fighters(:two)
  end

  test '.round' do
    d1, d2, summary = Fight.round(@f1, @f2)
    assert d1 == 23
    assert d2 == 27
    assert summary == "#{@f1.name} donne un coup de tête et #{@f2.name} lui renvoie un coup de pied\n"
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
