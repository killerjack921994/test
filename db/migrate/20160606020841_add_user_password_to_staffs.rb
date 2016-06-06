class AddUserPasswordToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :user, :string
    add_column :staffs, :password_digest, :string
  end
end
