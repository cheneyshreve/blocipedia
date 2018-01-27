require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:my_user) { User.create!(email: 'blochead@bloc.io', password: 'password', password_confirmation: 'password') }
  let(:wiki) { Wiki.create!(user: my_user, title: "New wiki title", body: "New wiki body", private: false) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:user) }

  describe "attributes" do
    it "resonds to title" do
      expect(wiki).to have_attributes(title: wiki.title)
    end
    it "responds to body" do
      expect(wiki).to have_attributes(body: wiki.body)
    end

    it "responds to private" do
      expect(wiki).to have_attributes(private: wiki.private)
    end
  end

end
