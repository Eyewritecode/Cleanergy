class AddMeterNumberToBillings < ActiveRecord::Migration
  def change
    add_column :billings, :meter_number, :string
  end
end
