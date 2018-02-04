require 'rails_helper'

RSpec.describe Collaborate, type: :model do
  let(:user) { User.create!(email: 'blocstudent@bloc.io', password: 'password', password_confirmation: 'password', role: 'standard') }
  let(:wiki) { Wiki.create!(user: user, title: "New wiki title", body: "New wiki body", private: false ) }

  let(:collaborate) { Collaborate.create!(wiki: wiki, user: user) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:wiki) }

end
