class AddStreamToTracks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tracks, :stream, null: false, foreign_key: true
  end
end
