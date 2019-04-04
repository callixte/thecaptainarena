class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.references :winner
      t.references :loser
      t.text :summary

      t.timestamps
    end

    add_foreign_key :fights, :fighters, column: :winner_id, primary_key: :id
    add_foreign_key :fights, :fighters, column: :loser_id, primary_key: :id
  end
end
