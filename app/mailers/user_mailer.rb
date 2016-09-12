class UserMailer < ApplicationMailer
	default from: "austinbikesruby@gmail.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
			:to => 'austinbikesruby@gmail.com',
			:subject => "A new contact form message from #{name}"
			)
	end

end
