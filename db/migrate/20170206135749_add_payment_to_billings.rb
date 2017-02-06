class AddPaymentToBillings < ActiveRecord::Migration
  def change
    add_column :billings, :payment, :string
  end
end
