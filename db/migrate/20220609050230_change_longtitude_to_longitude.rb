class ChangeLongtitudeToLongitude < ActiveRecord::Migration[6.1]
  def change
    rename_column :childcares, :longtitude, :longitude
  end
end
