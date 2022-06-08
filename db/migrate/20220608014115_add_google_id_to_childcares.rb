class AddGoogleIdToChildcares < ActiveRecord::Migration[6.1]
  def change
    add_column :childcares, :place_id, :string
  end
end
