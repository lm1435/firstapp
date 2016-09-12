class StaticPagesController < ApplicationController
	def index
  	end

	def landing_page
		@featured_product = Product.first
		@products = Product.limit(4)
	end

	def thank_you
		@name = params[:name]
		@email = params[:email]
		@message = params[:message]
		# UserMailer.contact_form(@email, @name, @message).deliver_now
		ActionMailer::Base.mail(
			:from => @email,
			:to => 'austinbikesruby@gmail.com',
			:subject => 'A new contact form message sent from #{@name}',
			:body => @message).deliver_now

	end

end


