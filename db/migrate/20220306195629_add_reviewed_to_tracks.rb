class AddReviewedToTracks < ActiveRecord::Migration[6.0]
  def change
    add_column :tracks, :reviewed, :boolean, default: false, null: false
  end
end
