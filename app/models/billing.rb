class Billing < ActiveRecord::Base
	validates_presence_of :pic
	belongs_to :user
	mount_uploader :pic, MeterpicUploader
	
end
