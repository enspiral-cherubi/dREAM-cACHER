User.destroy_all
Dream.destroy_all
Tag.destroy_all
Theme.destroy_all

users = []
tags = []
dreams = []

tags = ["fuck","teeth","money","sex","food","music","love","hate","gold","bars","tsunami","earthquake","party"]

tags.length.times do |i|
  tag = Tag.create(word: tags[i])
end


10.times do
  user = User.create(
    email: Faker::Internet.email,
    user_name: Faker::Internet.user_name,
    password: Faker::Internet.password(8)
  )
  users.push user
end

2.times do
  10.times do | i |
    dream = Dream.create(
      contents: Faker::Lorem.paragraph,
      sentiment: 0.5,
      user_id: users[i].id,
    )
    dreams.push dream
  end
end

3.times do
  dreams.length.times do | i |
    Theme.create(
      dream_id: dreams[i],
      tag_id: tags.sample
    )
  end
end





# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
