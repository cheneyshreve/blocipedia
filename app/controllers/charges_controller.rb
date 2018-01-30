require 'stripe'

class ChargesController < ApplicationController

  def create

    customer = StripeTool.create_customer(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = StripeTool.create_charge(
      customer_id: customer.id,
      amount: Amount.default,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

   upgrade = StripeTool.upgrade_user(
     current_user: current_user
   )

   # current_user.update_attribute(:role, 'premium')
   flash[:notice] = "Thanks for all the money, #{current_user.email}! Your account has been upgraded to Premium."
   redirect_to wikis_path

   # Stripe will send back CardErrors. This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: ENV["PUBLISHABLE_KEY"],
      description: "Premium Membership - #{current_user.email}",
      amount: Amount.default
    }
  end


end
