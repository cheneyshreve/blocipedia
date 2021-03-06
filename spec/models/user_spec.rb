require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: 'first_bloc@bloc.io', password: 'password', role: "standard", stripe_customer_id: "")}
  let(:other_user) { User.create!(email: 'second_bloc@bloc.io', password: 'password', role: "premium", stripe_customer_id: "")}
  let(:wiki) { Wiki.create!(user: user, title: "New wiki title", body: "New wiki body", private: false ) }

  it { is_expected.to have_many(:collaborates) }
   describe "attributes" do
     it "responds to email" do
      expect(user).to respond_to(:email)
     end

     it "responds to password" do
       expect(user).to respond_to(:password)
     end

     it "responds to password_confirmation" do
       expect(user).to respond_to(:password_confirmation)
     end

     it "responds to role" do
       expect(user).to respond_to(:role)
     end

     it "responds to stripe_customer_id" do
       expect(user).to respond_to(:stripe_customer_id)
     end

   end
   
  context "standard user" do
    it "is standard by default" do
        expect(user.role).to eql("standard")
    end
  end

  context "premium user" do
      before do
        user.premium!
      end

      it "returns false for #standard?" do
        expect(user.standard?).to be_falsey
      end

      it "returns true for #premium?" do
        expect(user.premium?).to be_truthy
      end
  end
  context "admin user" do
      before do
        user.admin!
      end

      it "returns false for #standard?" do
        expect(user.standard?).to be_falsey
      end

      it "returns true for #admin?" do
        expect(user.admin?).to be_truthy
      end
  end
end
