class AddTwitchIdToViewer < ActiveRecord::Migration[6.0]
  def change
    add_column :viewers, :twitch_id, :string
  end
end
