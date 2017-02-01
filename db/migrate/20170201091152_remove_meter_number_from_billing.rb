class RemoveMeterNumberFromBilling < ActiveRecord::Migration
  def change
  	remove_column :billings, :meter_number, :string
  end
end
