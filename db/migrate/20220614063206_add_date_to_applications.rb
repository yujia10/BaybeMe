class AddDateToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :date, :text
  end
end
