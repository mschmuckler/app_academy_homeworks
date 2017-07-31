class CreateCreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.string :feature, null: false
      t.text :lyrics
      t.integer :album_id, null: false

      t.timestamps
    end

    add_index :tracks, [:album_id]
  end
end
