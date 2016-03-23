# Create random standard Users
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "helloworld",
    password_confirmation: "helloworld",
    confirmed_at: Date.today
  )
end

# Create an admin user for my primary email
caroline = User.create!(
  email: "caroline@carolinecourtney.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  confirmed_at: Date.today
)
caroline.admin!

# Create a premium user for my secondary email
catravine = User.create!(
  email: "catravine@hotmail.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  confirmed_at: Date.today
)
catravine.premium!

# Create a main standard user
User.create!(
  email: "peebles@poobles.com",
  password: "helloworld",
  password_confirmation: "helloworld",
  confirmed_at: Date.today
)

# Total Users
users = User.all

# Create Wikis
50.times do
  Wiki.create(
    title: Faker::Commerce.product_name,
    body: Faker::Lorem.paragraphs(3),
    public: [true, false].sample,
    user: users.sample
    )
end
wikis = Wiki.all

# Results
puts "Seed Finished..."
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
