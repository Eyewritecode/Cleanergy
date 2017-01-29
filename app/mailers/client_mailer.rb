class ClientMailer < ApplicationMailer
	def accuse_de_reception(user)
		@client = current_user
		@amount = "500$"
		mail(to: @client.email, subject: 'Payment confirmation')
	end
end
