class Billing < ActiveRecord::Base
	belongs_to :user
	mount_uploader :pic, MeterpicUploader
	#before_save :ocr


  # def ocr
  #   image = RTesseract.new(:)
  #   @text = image.to_s
  # end
end
