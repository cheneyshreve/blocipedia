require 'stripe'

class ChargesController < ApplicationController
  before_action :set_plan

  def create
  # create a normal account, and a subscription
  if params[:subscription]
    customer = StripeTool.create_customer(
      email: current_user.email,
      card: params[:stripeToken]
    )
    subscribe = StripeTool.subscribe(customer: customer, plan: @plan)
    current_user.stripe_customer_id = customer.id
    current_user.save

    charge = StripeTool.create_charge(
      customer_id: customer.id,
      amount: Amount.default,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

   upgrade = StripeTool.upgrade_user(
     current_user: current_user
   )

   flash[:notice] = "Thanks for all the money, #{current_user.email}! Your account has been upgraded to Premium."
   redirect_to wikis_path

  # find the user account, cancel their subscription, and return to 'standard'
elsif params[:cancel_subscription]
  # check if user has a premium subscription

  customer = StripeTool.cancel(current_user: current_user)
  downgrade = StripeTool.downgrade_user(current_user: current_user)
  

  flash[:notice] = "Thanks, #{current_user.email}! Your subscription has been cancelled."
  redirect_to wikis_path

  else
    # create a normal account without a subscription
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
  end
   # Stripe will send back CardErrors. This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: ENV["PUBLISHABLE_KEY"],
      description: "Premium Membership - #{current_user.email}",
      amount: Amount.default,
      subscribe: nil
    }
  end

  private
   def set_plan
     # test plan info
     @plan = 9999
   end

end
