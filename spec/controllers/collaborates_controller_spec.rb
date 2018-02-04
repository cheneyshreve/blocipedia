require 'rails_helper'

RSpec.describe CollaboratesController, type: :controller do
  let(:user) { User.create!(email: 'blochead@bloc.io', password: 'password', password_confirmation: 'password', role: 'standard') }
  let(:wiki) { Wiki.create!(user: user, title: "New wiki title", body: "New wiki body", private: false) }
  let(:collaborates) { Collaborate.new(user: user, wiki: wiki ) }


 before(:each) do
   sign_in user
 end

  describe "#create" do
    it "adds a new collaboration" do
       expect(wiki.collaborates).not_to be_nil
    end
  end

end
