class ChangeAddressToChildcare < ActiveRecord::Migration[6.1]
  def change
      change_table :childcares do |t|
        t.change :longtitude, :float
       t.change :latitude, :float
    end
  end
end
