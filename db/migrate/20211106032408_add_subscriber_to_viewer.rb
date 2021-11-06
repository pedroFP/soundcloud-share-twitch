class AddSubscriberToViewer < ActiveRecord::Migration[6.0]
  def change
    add_column :viewers, :subscriber, :boolean, default: false
  end
end
