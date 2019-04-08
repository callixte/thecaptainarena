# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
NAMES = %w[Joe Jean Reginald Archibald Henri David Jérôme Maxime Pierre Louis]
SURNAMES = %w[Magnifique Brave Fou Rusé Conquerrant Sanguinaire Sauvage Puissant
  Terrible Barbare Noir Rouge]

Weapon.destroy_all
Fight.destroy_all
Fighter.destroy_all

rdm = Random.new
NAMES.each do |n|
  name = n + ' le ' + SURNAMES[rdm.rand(8)]
  life = 70 + rdm.rand(30)
  force = 70 + rdm.rand(30)
  dext = 250 - life - force
  Fighter.create!(
    name: name,
    life_points: life,
    attack_points: force,
    dexterity: dext
  )
end

fighters = Fighter.all
fighters.each do |f1|
  f2 = fighters[rdm.rand(fighters.size)]
  if f1 != f2
    Fight.start(f1, f2)
  end
end

weapons = [
  [ 'épée', 10, 0 ],
  [ 'couteau', 3, 0 ],
  [ 'dague', 5, 0 ],
  [ 'hache', 13, 0],
  [ 'bouclier', 0, 10 ]
]
weapons.each do |name, attack, defence|
  Weapon.create!(name: name, attack: attack, defence: defence)
end
