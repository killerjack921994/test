class AddForeignKey < ActiveRecord::Migration
  def change
    add_reference :books, :staffs, index: true
    add_foreign_key :books, :staffs
  end
end
