User.create!(first_name: "Example",
             last_name: "User",
             username:  "Example User",
             email: "example@ex.org",
             password:              "foobar",
             password_confirmation: "foobar")

20.times do |i|
  User.create!(first_name: "Example",
               last_name: "User",
               username:  Faker::Name.name,
               email: "example@ex.org",
               password:              "foobar",
               password_confirmation: "foobar")
end

user = User.first
25.times do 
  user.events.create!(title: Faker::Book.title,
                    game: "taco",
                    description: Faker::Lorem.sentence(5),
                    start_time: Faker::Time.between(2.years.ago, 2.years.from_now))
end

event = Event.first
20.times do |i|
  event.invitations.create!(attendee_id: (i + 2))
end