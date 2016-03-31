require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:my_user) { create(:user) }
  let(:premium_user) { create(:user, role: "premium") }
  let(:my_wiki) { create(:wiki, user: my_user) }
  let(:private_wiki) { create(:wiki, user: premium_user, public: false) }

  it { should belong_to(:user) }
  it { should have_many(:collaborators) }

  describe "attributes" do
    it "responds to title" do
      expect(my_wiki).to respond_to(:title)
    end

    it "responds to body" do
      expect(my_wiki).to respond_to(:body)
    end

    it "responds to public" do
      expect(my_wiki).to respond_to(:public)
    end

    it "defaults to public = true" do
      expect(my_wiki.public?).to eq(true)
    end
  end
end
