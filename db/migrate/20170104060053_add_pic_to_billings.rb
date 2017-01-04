class AddPicToBillings < ActiveRecord::Migration
  def change
    add_column :billings, :pic, :string
  end
end
