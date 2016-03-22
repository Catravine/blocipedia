FactoryGirl.define do
  factory :wiki do
    title "Wiki Title"
    body "some wiki content"
    public true
    user
  end
end
