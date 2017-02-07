class Billing < ActiveRecord::Base
	validates_presence_of :pic
  validates_presence_of :user_id
	belongs_to :user
	belongs_to :payment
	mount_uploader :pic, MeterpicUploader
	after_save :getters
  #before_save :get_previous_value

	
		def get_name
      billing = self.id
      @test = self.pic.filename
    end
    def getters
      get_name
      text = RTesseract.new("#{Rails.root}/public/uploads/billing/pic/#{self.id}/#{@test}", lang: "eng").to_s
      self.update_column(:meter_number, text)
      #meter = lstNbr.meter_number
      #lstNbr = 
      #puts "$$$$$$$$$$$$$$$$$$$$$$$$ #{lstNbr["meter_number"]}"
      # puts "**********************************************************"
      # self.update_column(:payment, lstNbr["meter_number"])
    end
    def get_previous_value(user)
      @values = Billing.where(user_id = user).last
      puts " THE LAST WAS ************ #{@values["id"]} **************"
    end
end
