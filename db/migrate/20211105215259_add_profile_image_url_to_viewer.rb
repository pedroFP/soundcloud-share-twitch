class AddProfileImageUrlToViewer < ActiveRecord::Migration[6.0]
  def change
    add_column :viewers, :profile_image_url, :string
  end
end
