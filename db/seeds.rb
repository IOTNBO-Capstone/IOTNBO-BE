
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
labels_array = ["Low Cost",
    "Sliding Scale",
    "Works with Anxiety",
    "Works with Depression",
    "Works with Addiction",
    "Works with Trauma-based disorders",
    "Family Therapy/Marriage Counseling",
    "Grief Counseling",
    "In-house Pharmacy",
    "Psychiatry (Medication)",
    "POC",
    "LGBTQ+",
    "Works with Neurodivergence",
    "Works with Bipolar",
    "Works with"]
practice_1 = Practice.create!(name: "ABC therapy", website_url: "WWW.ABCD.com") 
practice_2 = Practice.create!(name: "Private Practice", website_url: "WWW.bobmckay.com") 
practice_3 = Practice.create!(name: "#{Faker::Movies::LordOfTheRings.location} therapy", website_url: Faker::Internet.url) 
practice_4 = Practice.create!(name: "#{Faker::Movies::LordOfTheRings.location} therapy", website_url: Faker::Internet.url) 
practice_5 = Practice.create!(name: "#{Faker::Movies::LordOfTheRings.location} therapy", website_url: Faker::Internet.url) 
therapist_1 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: "here to stay", labels: labels_array.sample(4), practice_id: practice_1.id, name: "Sarah Jones")
therapist_2 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: "slightly different", labels: labels_array.sample(4), practice_id: practice_1.id, name: "Peter Piper")
therapist_3 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: "even more different", labels: labels_array.sample(4), practice_id: practice_2.id, name: "Bob McKay")
therapist_4 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: Faker::Lorem.sentence(word_count: 3), labels: labels_array.sample(4), practice_id: practice_1.id, name: Faker::Movies::LordOfTheRings.character)
therapist_5 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: Faker::Lorem.sentence(word_count: 3), labels: labels_array.sample(4), practice_id: practice_3.id, name: Faker::Movies::LordOfTheRings.character)
therapist_6 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: Faker::Lorem.sentence(word_count: 3), labels: labels_array.sample(4), practice_id: practice_3.id, name: Faker::Movies::LordOfTheRings.character)
therapist_7 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: Faker::Lorem.sentence(word_count: 3), labels: labels_array.sample(4), practice_id: practice_4.id, name: Faker::Movies::LordOfTheRings.character)
therapist_8 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: Faker::Lorem.sentence(word_count: 3), labels: labels_array.sample(4), practice_id: practice_4.id, name: Faker::Movies::LordOfTheRings.character)
therapist_9 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: Faker::Lorem.sentence(word_count: 3), labels: labels_array.sample(4), practice_id: practice_5.id, name: Faker::Movies::LordOfTheRings.character)
therapist_10 = Therapist.create!(address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, image_url: Faker::LoremFlickr.image, bio: Faker::Lorem.sentence(word_count: 3), labels: labels_array.sample(4), practice_id: practice_5.id, name: Faker::Movies::LordOfTheRings.character)
