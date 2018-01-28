require 'rails_helper'
RSpec.describe User, type: :model do
   let(:user) { User.create!(email: 'bloc@bloc.io', password: 'password')}
   #
   # describe "attributes" do
   #
   #   it "responds to email" do
   #    expect(:user).to have_attributes(:email)
   #   end
   #
   #   it "responds to password" do
   #     expect(:user).to have_attributes(:password)
   #   end
   # end

end
