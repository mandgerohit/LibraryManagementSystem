class SubscribeMailer < ApplicationMailer
	default from: "nikunjmahendrashah@gmail.com"

	def sample_email(user,title)
    	@user = user
    	mail(to: @user, subject: 'Subscribed Book Available')
  	end

end
