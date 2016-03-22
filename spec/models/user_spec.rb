require 'rails_helper'

RSpec.describe User, type: :model do
  let(:my_user) { create(:user) }
  it { should have_many(:wikis) }

  describe "attributes" do
    it "should responsd to email" do
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
end
