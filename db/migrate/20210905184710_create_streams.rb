class CreateStreams < ActiveRecord::Migration[6.0]
  def change
    create_table :streams do |t|
      t.string :title
      t.datetime :aired_at
      t.boolean :receiving_tracks

      t.timestamps
    end
  end
end
