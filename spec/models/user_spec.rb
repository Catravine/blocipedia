require 'rails_helper'

RSpec.describe User, type: :model do
  let(:my_user) { create(:user) }

  it { should have_many(:wikis) }

  describe "attributes" do
    it "should respond to email" do
      expect(my_user).to respond_to(:email)
    end

    it "responds to role" do
      expect(my_user).to respond_to(:role)
    end

    it "responds to admin?" do
      expect(my_user).to respond_to(:admin?)
    end

    it "responds to premium?" do
      expect(my_user).to respond_to(:premium?)
    end

    it "responds to standard?" do
      expect(my_user).to respond_to(:standard?)
    end
  end

  describe "roles" do
    it "is standard by default" do
      expect(my_user.role).to eql("standard")
    end
  end

  describe "#downgrade!" do
    before do
      @premium_user = create(:user, role: 'premium')
      5.times { @premium_user.wikis.create(public: false) }
    end

    it 'downgrades the user' do
      expect(@premium_user.wikis.where(public: false).count).to eql(5)
      @premium_user.downgrade!
      expect(@premium_user.wikis.where(public: false).count).to eql(0)
      expect(@premium_user.role).to eql('standard')
    end
  end
end
