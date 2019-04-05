class AddDexterityToFighter < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :dexterity, :integer
  end
end
