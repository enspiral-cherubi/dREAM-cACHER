User.destroy_all
Dream.destroy_all
Tag.destroy_all

tags = ["fuck","teeth","money","sex","food","music","love","hate","gold","bars","tsunami","earthquake","party"]

13.times do |i|
  Tag.create(word: tags[i])
end




# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
