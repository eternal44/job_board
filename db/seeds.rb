# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "admin@gmail.com",
            role: "Admin",
            password: "password",
            password_confirmation: "password")

User.create(email: "jamesyoun710@gmail.com",
            role: "Employer",
            password: "gooneen44",
            password_confirmation: "gooneen44")

2.times do |i|
  email = "example-#{i+1}@example.com"
  password = "password"
  User.create( email: email,
              role: "Employer",
              password: password,
              password_confirmation: password)
end

5.times do |n|
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create(email: email,
              role: "Worker",
              password: password,
              password_confirmation: password)
end

Profile.all.each do |profile|
  name = Faker::Name.name
  profile.update(name: name)
end

job_type = ['cleaning', 'building', 'repairing']
job_type.each do |job|
  JobType.create(job_type: job)
end

users = User.where('id < 4')
10.times do
  location = Faker::Address.street_address
  first_start_time_choice = Faker::Time.between(DateTime.now + 20, DateTime.now)
  second_start_time_choice = first_start_time_choice + 1
  users.each { |user| user.jobs.create!(location: location,
                                        first_start_time_choice: first_start_time_choice,
                                        second_start_time_choice: second_start_time_choice,
                                        status: 'Created') }
  job_type = JobType.find(rand(1..3))
  Job.last.job_types << job_type
  Job.last.save

end
