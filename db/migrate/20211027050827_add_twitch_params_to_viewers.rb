class AddTwitchParamsToViewers < ActiveRecord::Migration[6.0]
  def change
    add_column :viewers, :twitch_id, :string
    add_column :viewers, :twitch_login, :string
    add_column :viewers, :twitch_display_name, :string
  end
end
