class CreateChildcares < ActiveRecord::Migration[6.1]
  def change
    create_table :childcares do |t|
      t.string :name
      t.string :email
      t.string :address
      t.text :url
      t.text :description

      t.timestamps
    end
  end
end
