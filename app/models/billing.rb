class Billing < ActiveRecord::Base
	validates_presence_of :pic
  validates_presence_of :user_id
	belongs_to :user
	belongs_to :payment
	mount_uploader :pic, MeterpicUploader
	after_save :ocr

	private
		def get_name
      billing = self.id
      @test = self.pic.filename
      
    end
    def ocr
      get_name
      text = RTesseract.new("#{Rails.root}/public/uploads/billing/pic/#{self.id}/#{@test}", lang: "eng").to_s
      self.update_column(:meter_number, text)
    end
end
