class AddUserIdToBillings < ActiveRecord::Migration
  def change
    add_column :billings, :user_id, :integer
  end
end
