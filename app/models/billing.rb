class Billing < ActiveRecord::Base
	validates_presence_of :pic
  validates_presence_of :user_id
	belongs_to :user
	mount_uploader :pic, MeterpicUploader
	after_save :old_bill, :getters
  #before_create :imprevu
  
  private
    # def imprevu
    #   if self.meter_number.nil?
    #     self.update_column(:meter_number, "") 
    # end
    def old_bill
      @last_value = self.payment.to_i 
    end

		def get_name
      billing = self.id
      @test = self.pic.filename
    end
    
    def getters
      old_bill
      get_name

      text = RTesseract.new("#{Rails.root}/public/uploads/billing/pic/#{self.id}/#{@test}", lang: "eng").to_s
      bill = (text.to_i - @last_value)
      puts "*****#{text} MINUS #{@last_value} ******* "
      self.update_column(:meter_number, text)
      self.update_column(:payment, bill)
    end
    
end
