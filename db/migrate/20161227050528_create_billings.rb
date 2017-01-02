class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.integer :meter_number
      t.string :meter_image

      t.timestamps null: false
    end
  end
end
