class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.references :viewer, null: false, foreign_key: true
      t.string :soundcloud_url

      t.timestamps
    end
  end
end
