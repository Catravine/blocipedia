require 'rails_helper'

RSpec.describe Collaborator, type: :model do
  let(:premium_user) { create(:user, role: "premium") }
  let(:another_user) { create(:user) }
  let(:private_wiki) { create(:wiki, public: false) }
  let(:my_collab) { Collaborator.create!(user: another_user, wiki: private_wiki) }

  it { should belong_to(:user) }
  it { should belong_to(:wiki) }
end
