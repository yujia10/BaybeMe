class AddAddressToChildcares < ActiveRecord::Migration[6.1]
  def change
    add_column :childcares, :latitude, :decimal, precision: 10, scale: 6
    add_column :childcares, :longtitude, :decimal, precision: 10, scale: 6
  end
end
