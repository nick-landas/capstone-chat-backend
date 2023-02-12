class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :fan, null: false, foreign_key: true
      t.references :squad, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
