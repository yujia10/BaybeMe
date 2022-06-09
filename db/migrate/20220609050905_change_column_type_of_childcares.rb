class ChangeColumnTypeOfChildcares < ActiveRecord::Migration[6.1]
  def change
    change_column :childcares, :longitude, :float
    change_column :childcares, :latitude, :float
  end
end
