class AddRatingToChildcares < ActiveRecord::Migration[6.1]
  def change
    add_column :childcares, :rating, :integer
  end
end
