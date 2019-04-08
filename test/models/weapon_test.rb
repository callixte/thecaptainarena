require 'test_helper'

class WeaponTest < ActiveSupport::TestCase
  test 'valid weapon' do
    weapon = Weapon.new(name: 'Coutelas', attack: 3, defence: 0)
    assert weapon.valid?
  end
end
