
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
    "Works with Self-Esteem"]
practice_1 = Practice.create!(name: "ABC therapy", website_url: "WWW.ABCD.com") 
practice_2 = Practice.create!(name: "Private Practice", website_url: "WWW.bobmckay.com") 
practice_3 = Practice.create!(name: "#{Faker::Movies::LordOfTheRings.location} therapy", website_url: Faker::Internet.url) 
practice_4 = Practice.create!(name: "#{Faker::Movies::LordOfTheRings.location} therapy", website_url: Faker::Internet.url) 
practice_5 = Practice.create!(name: "#{Faker::Movies::LordOfTheRings.location} therapy", website_url: Faker::Internet.url) 
therapist_1 = Therapist.create!(address: Faker::Address.full_address, phone_number: "(333)-333-3333", image_url: "https://i.ibb.co/vHN8bjb/Galadriel.webp", bio: "She was known, especially in her younger days, as being quite prideful. However, by the end of the Third Age, that pride had been tempered a great deal by age.", labels: labels_array.sample(4), practice_id: practice_1.id, name: "Galadriel")
therapist_2 = Therapist.create!(address: Faker::Address.full_address, phone_number: "444-444-4444", image_url: "https://i.ibb.co/LNYV8Wt/Frodo.webp", bio: "He was very kind and compassionate, pitying Gollum and allowing him to guide him and Sam to Mordor despite Sam's distrust of the creature. This act of kindness later proved to be a factor in the quest's success in destroying the Ring.", labels: labels_array.sample(4), practice_id: practice_1.id, name: "Frodo Baggins")
therapist_3 = Therapist.create!(address: Faker::Address.full_address, phone_number: "(555)-555-5555", image_url: "https://i.ibb.co/QHSWTF3/Bilbo.webp", bio: "Bilbo was a very friendly and well-mannered hobbit fond of food, drink, a full pipe, his friends, and good cheer, and was known for greeting strangers and friends with hospitality saying; 'At your service and your family's.'", labels: labels_array.sample(4), practice_id: practice_2.id, name: "Bilbo Baggins")
therapist_4 = Therapist.create!(address: Faker::Address.full_address, phone_number: "555-555-5555", image_url: "https://i.ibb.co/3mRtF5W/Gandalf.webp", bio: "Hobbits appealed to him more than to the other Wizards, and he often went to the Shire for respite from errands. His attachment was likely because the Shire was more blissful and peaceful than other inhabited realms of Middle-earth.", labels: labels_array.sample(4), practice_id: practice_1.id, name: "Gandalf")
therapist_5 = Therapist.create!(address: Faker::Address.full_address, phone_number: "111-111-1111", image_url: "https://i.ibb.co/qR40Z9R/Thorin.webp", bio: "While he initially shared the greed of his family and had an extensive love for gold, he valued the welfare of others as well. He was immensely brave and was willing to give himself up for a just cause.", labels: labels_array.sample(4), practice_id: practice_3.id, name: "Thorin Oakenshield")
therapist_6 = Therapist.create!(address: Faker::Address.full_address, phone_number: "(222)-222-2222", image_url: "https://i.ibb.co/LnprZrH/Legolas.webp", bio: "Like all Elves, Legolas had great respect and appreciation for nature. He was kind, caring greatly for his friends.", labels: labels_array.sample(4), practice_id: practice_3.id, name: "Legolas")
therapist_7 = Therapist.create!(address: Faker::Address.full_address, phone_number: "777-777-7777", image_url: "https://i.ibb.co/ZV5JpQX/Aragorn.webp", bio: "Aragorn possessed Elven wisdom due to his childhood in Rivendell with Elrond and the foresight of the Dúnedain. He was also a skilled healer, a mighty warrior, and an unmatched commander.", labels: labels_array.sample(4), practice_id: practice_4.id, name: "Aragorn Elessar")
therapist_8 = Therapist.create!(address: Faker::Address.full_address, phone_number: "(777)-888-8888", image_url: "https://i.ibb.co/bRJ1vbZ/Samwise-Gamgee.webp", bio: "The truest of heroes.", labels: labels_array.sample(4), practice_id: practice_4.id, name: "Samwise Gamgee")
therapist_9 = Therapist.create!(address: Faker::Address.full_address, phone_number: "888-888-8888", image_url: "https://i.ibb.co/pKPQG2L/Boromir.webp", bio: "Above all else exceedingly valiant and steadfast and was held in great esteem by the fighting men of both Gondor and Rohan. He was selfless and bold.", labels: labels_array.sample(4), practice_id: practice_5.id, name: "Boromir")
therapist_10 = Therapist.create!(address: Faker::Address.full_address, phone_number: "(888)-777-6666", image_url: "https://i.ibb.co/HzjFQTJ/Elrond.webp", bio: "Effective at leadership and gave much wise counsel. Also had the gift of foresight, through which he could view lands and events far away from Rivendell. He was also adept at healing others.", labels: labels_array.sample(4), practice_id: practice_5.id, name: "Elrond")
