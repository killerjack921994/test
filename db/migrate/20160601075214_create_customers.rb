class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.date :birthday
      t.string :gender
      t.string :phone
      t.text :address
      t.string :email

      t.timestamps null: false
    end
  end
end
