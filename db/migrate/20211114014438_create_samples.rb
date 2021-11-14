class CreateSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :samples do |t|
      t.string :link
      t.references :stream, null: false, foreign_key: true

      t.timestamps
    end
  end
end
