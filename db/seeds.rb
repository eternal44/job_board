# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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

User.create(email: "admin@gmail.com",
            role: "Admin",
            password: "password",
            password_confirmation: "password")

User.create(email: "jamesyoun710@gmail.com",
            role: "Attendant",
            password: "gooneen44",
            password_confirmation: "gooneen44")

Profile.all.each do |profile|
  name = Faker::Name.name
  profile.update(name: name)

  phone = Faker::PhoneNumber.cell_phone
  profile.update(phone_number: phone)
end

#############
# JOB SEEDS #
#############
job_type = ['cleaning',
           'construction',
           'landscaping',
           'moving',
           'painting',
           'other']

job_type.each do |job|
  JobType.create(job_type: job)
end

address_list = ['2261 Market St San Francisco, CA 94114',
                '912 Cole St San Francisco, CA 94117',
                '1400 Pine St San Francisco, CA 94109',
                '150 Sutter St San Francisco, CA 94104']

users = User.where('id < 3')
10.times do
  users.each do |user|
    location = address_list[rand(0..3)]
    subject = Faker::Book.title
    user.jobs.create!(
      subject: subject,
      location: location,
      appointment_date_time: '11/09/2015 12:00 AM',
      status: 'Unconfirmed',
      priority: 'NOT URGENT',
      overdue: false,
      number_of_workers: 2,
      min_hours: 3,
      max_hours: 5,
      price_per_worker: 30,
      job_categories: 'cleaning'
    )

    job_type = JobType.find(rand(1..6))
    Job.last.job_types << job_type
    Job.last.save
  end
end
