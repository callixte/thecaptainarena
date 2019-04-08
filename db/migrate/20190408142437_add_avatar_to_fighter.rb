class AddAvatarToFighter < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :avatar, :string
  end
end
