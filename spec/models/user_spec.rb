require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: 'bloc@bloc.io', password: 'password', role: "standard")}

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
