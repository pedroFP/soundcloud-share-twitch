class AddLikesCountToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :likes_count, :integer, default: 0, null: false
  end
end
