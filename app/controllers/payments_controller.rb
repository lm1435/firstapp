class PaymentsController < ApplicationController


  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
  # To create the charge on Stripe's servers - aka this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => (@product.price*100).to_i, # amount in cents again
        :currency => "usd",
        :source => token,
        :description => params[:stripeEmail]
      )

    if charge.paid
      Order.create(product_id: @product_id, user_id: @user_id, total: @product.price)
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    #  redirect_to payments_create_path, notice: "From everyone at Austin Bikes!"
  end
end
