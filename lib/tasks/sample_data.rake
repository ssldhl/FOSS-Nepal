namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    admin = User.create!(username: "Admin123",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)

    User.create!(username: "User123",
                 email: "example@example.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      invalid_username  = Faker::Internet.user_name
      username = invalid_username.gsub(/[^0-9a-z]/i, 'a')
      email = Faker::Internet.free_email
      password  = "password"
      User.create!(username: username,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end