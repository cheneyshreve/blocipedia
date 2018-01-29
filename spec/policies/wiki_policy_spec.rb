require 'spec_helper'

describe WikiPolicy do
  subject { described_class.new(user, wiki) }

  context "for a wiki user" do
    let(:user) { FactoryGirl.create(:user) }
    let(:wiki) { Wiki.create }
    it { should permit(:show) }
    it { should permit(:create) }
    it { should permit(:edit) }
    it { should permit(:update) }
  end
end
