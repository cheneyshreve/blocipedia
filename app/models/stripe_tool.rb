module StripeTool

  def self.create_customer(email: email, card: card)
    Stripe::Customer.create(
      email: email,
      card: card
    )
  end

  def self.subscribe(customer: customer, plan: plan)
   Stripe::Subscription.create(
     customer: customer,
     plan: 9999
   )
  end

  def self.create_charge(customer_id: customer_id, amount: amount, description: description, currency: currency)
    Stripe::Charge.create(
      customer: customer_id,
      amount: amount,
      description: description,
      currency: currency
    )
  end

  def self.cancel(current_user: current_user)
    customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
    customer.subscriptions.data.first.delete
    customer.save
  end

 def self.upgrade_user(current_user: current_user)
   current_user.update_attributes(:role => "premium")
 end

 def self.downgrade_user(current_user: current_user)
   current_user.update_attributes(:role => "standard")
 end

end
