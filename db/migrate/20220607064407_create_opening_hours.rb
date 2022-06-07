class CreateOpeningHours < ActiveRecord::Migration[6.1]
  def change
    create_table :opening_hours do |t|
      t.string :time
      t.references :childcare, null: false, foreign_key: true

      t.timestamps
    end
  end
end
