require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:my_user) { create(:user) }
  let(:my_wiki) { create(:wiki, user: my_user) }

  it { should belong_to(:user) }

  describe "attributes" do
    it "responds to title" do
      expect(my_wiki).to respond_to(:title)
    end

    it "responds to body" do
      expect(my_wiki).to respond_to(:body)
    end

    it "responds to private" do
      expect(my_wiki).to respond_to(:public)
    end
  end

end
