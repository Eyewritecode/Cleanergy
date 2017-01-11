class RemoveMeterImageFromBilling < ActiveRecord::Migration
  def change
    remove_column :billings, :meter_image, :string
  end
end
