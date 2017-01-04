class Billing < ActiveRecord::Base
	belongs_to :user
	mount_uploader :pic, MeterpicUploader
end
