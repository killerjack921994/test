class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :comment
      t.string :user

      t.timestamps null: false
    end
  end
end
