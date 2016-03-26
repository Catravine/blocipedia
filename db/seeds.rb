# Create random standard Users
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: "helloworld",
    password_confirmation: "helloworld",
    confirmed_at: Date.today,
    role: ["standard", "premium"].sample
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
premiums = User.where(role: "premium").all

# Create Wikis
50.times do
  Wiki.create(
    title: Faker::Commerce.product_name,
    body: Faker::Lorem.paragraphs(3),
    user: users.sample
    )
end
wikis = Wiki.all

# Make some of the wikis by premium users private
Wiki.all.each { |wiki| wiki.update(public: false) if (wiki.user.premium? && rand(2) == 1) }
private_wikis = Wiki.where(public: false).all

# Results
puts "Seed Finished..."
puts "#{User.count} total users created"
puts "#{premiums.count} premium users created"
puts "#{Wiki.count} total wikis created"
puts "#{private_wikis.count} private wikis created"
