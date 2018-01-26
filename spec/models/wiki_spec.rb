require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) { Wiki.create!(title: "New wiki title", body: "New wiki body", private: false) }
  let(:user) { User.create!(email: 'blochead@bloc.io', password: 'password', password_confirmation: 'password') }

  describe "attributes" do
    it "resonds to title" do
      expect(wiki).to have_attributes(:title)
    end
    it "responds to body" do
      expect(wiki).to have_attributes(:body)
    end

    it "responds to private" do
      expect(wiki).to have_attributes(:private)
    end
  end

end
