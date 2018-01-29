require 'spec_helper'
require 'devise'
require 'shoulda-matchers'
require 'pundit/rspec'
require 'pundit/matchers'

describe WikiPolicy, type: :policy do

  subject { described_class.new(user,wiki) }

  let(:user) { FactoryGirl.create(:user) }

  context "for a wiki user" do
    let(:wiki) { Wiki.create(user: user, title: "Wiki name", body: "Wiki body") }
    it { should permit_action(:create) }
    it { should permit_action(:edit) }
    it { should permit_action(:update) }
    it { should permit_action(:destroy) }

  end

end
