module StripeTool

  def self.create_customer(email: email, card: card)

    Stripe::Customer.create(
      email: email,
      card: card
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


 def self.upgrade_user(current_user: current_user)
   current_user.update_attribute(:role, 'premium')
 end

 def self.downgrade_user(user: current_user)
  current_user.update_attribute(:role, 'standard')
 end


end
