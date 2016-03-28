require 'rails_helper'

RSpec.describe User, type: :model do
  let(:my_user) { create(:user) }
  let(:my_user_2) { create(:user, email: "caroline@example.com") }
  let(:premium_user) { create(:user, role: 'premium') }

  it { should have_many(:wikis) }
  it { should have_many(:collaborators) }

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

  describe "#name" do
    it "should return the username part of the email, capitalized" do
      expect(my_user_2.name).to eq("Caroline")
    end
  end

  describe "#downgrade!" do
    before do
      5.times { create(:wiki, user: premium_user, public: false) }
    end

    it "downgrades the user" do
      expect(Wiki.where(user: premium_user, public: false).count).to eq 5
      premium_user.downgrade!
      expect(premium_user.role).to eq("standard")
      expect(Wiki.where(user: premium_user, public: false).count).to eq 0
    end

    it "destroys collaborator associated with private wikis" do
      pending("destroy the collabs")
      fail
    end
  end
end
