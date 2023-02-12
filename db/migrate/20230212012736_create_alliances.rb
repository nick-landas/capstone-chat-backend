class CreateAlliances < ActiveRecord::Migration[7.0]
  def change
    create_table :alliances do |t|
      t.references :fan, null: false, foreign_key: true
      t.references :squad, null: false, foreign_key: true
      t.datetime :last_viewed

      t.timestamps
    end
  end
end
