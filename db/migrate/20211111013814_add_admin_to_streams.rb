class AddAdminToStreams < ActiveRecord::Migration[6.0]
  def change
    add_reference :streams, :admin, null: false, foreign_key: true
  end
end
