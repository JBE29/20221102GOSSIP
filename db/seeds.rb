require 'faker'

City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
Gossiptag.destroy_all



10.times do 
    City.create!(
        name: Faker::Address.city,
        zip_code: Faker::Address.zip_code
    )
end

10.times do
    User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name, 
        login: Faker::Music::Hiphop.artist,
        description: Faker::Games::Pokemon.move,
        email: Faker::Internet.email,
        age: Faker::Number.between(from: 7, to: 77),
        city_id: City.all.sample.id
    )
end

20.times do
    Gossip.create!(
        title: Faker::Book.title,
        content: Faker::Movies::Lebowski.quote,
        user_id: User.all.sample.id
    )
end

10.times do
    Tag.create!(
        title: Faker::Emotion.noun
    )
end

20.times do
    pm = PrivateMessage.create!(
        content: Faker::Lorem.paragraph,
        sender_id: User.all.sample.id,
        recipient_id: User.all.sample.id
    )
   
end