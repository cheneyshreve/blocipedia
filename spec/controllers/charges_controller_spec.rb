require 'rails_helper'
require 'stripe_mock'

RSpec.describe ChargesController, type: :controller do
  include StripeTool
  let(:stripe_helper) { StripeMock.create_test_helper }
  before { StripeMock.start }
  after { StripeMock.stop }

  let (:customer){ Stripe::Customer.create({ email: 'johnny@appleseed.com', card: stripe_helper.generate_card_token }) }
  let(:plan) { stripe_helper.create_plan(:id => '9999', :amount => 1500 ) }
  let (:charge) { Stripe::Charge.create(customer: customer.id, amount: 1500, currency: 'usd') }

 describe "#create without subscription" do
    it "creates a stripe customer" do
      email = customer.email
      expect(email).to eq('johnny@appleseed.com')
    end

    it "charges the user" do
      allow(Stripe::Charge).to receive(:retrieve).and_return(1500)
      expect(charge.amount).to eq(1500)
    end

    it "upgrades the user role to premium" do
     customer.role = "standard"
     StripeTool.upgrade_user(current_user: customer)
     expect(customer.role).to eq("premium")
    end
  end

  describe "#create with subscription" do
     it "adds a subscription to plan 9999" do
      card_token = StripeMock.generate_card_token(last4: "4242", exp_year: 2020)
      customer = Stripe::Customer.create(source: card_token)
      subscribe = StripeTool.subscribe(customer: customer, plan: plan)
      expect(plan.id).to eq("9999")
     end
  end

  describe "downgrade user" do
    it "cancels the user's subscription" do
      card_token = StripeMock.generate_card_token(last4: "4242", exp_year: 2020)
      customer = Stripe::Customer.create(source: card_token)
      customer.stripe_customer_id = customer.id
      subscribe = StripeTool.subscribe(customer: customer, plan: plan)
      unsubscribe = StripeTool.cancel(current_user: customer)
      expect(customer.subscriptions.data.first).to eq(nil)
    end

    it "changes the user's role back to standard" do
      customer.role = "premium"
      StripeTool.downgrade_user(current_user: customer)
      expect(customer.role).to eq("standard")
    end
  end


end
