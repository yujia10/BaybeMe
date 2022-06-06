class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.integer :gender, default: 0
      t.date :dob
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
