# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

#user
paul = User.create!(name: "paul")
loofie = User.create!(name: "loofie")
boof = User.create!(name: "boof")
lucy = User.create!(name: "lucy")
snoopy = User.create!(name: "snoopy")
harold = User.create!(name: "harold")
merk = User.create!(name: "merk")
cheif = User.create!(name: "Master_cheif")
lemur = User.create!(name: "lemur")
giraffe = User.create!(name: "giraffe")
monkey = User.create!(name: "monkey")

#artwork
# title, img_url, artist_id
mona = Artwork.create!(title: "mona lisa", img_url: "youtube.com", artist_id: 1)
kraut = Artwork.create!(title: "fermented cabbage", img_url: "www.cabbage.stank", artist_id: 3)
mona = Artwork.create!(title: "durian", img_url: "www.durian.com", artist_id: 5)
picasso = Artwork.create!(title: "picasso's dog", img_url: "errorcodedogs.com", artist_id: 8)
cake = Artwork.create!(title: "schrodingers cake", img_url: "cake_is_a_lie.com", artist_id: 4)

#ArtworkShare
#vewer_id, artwork_id

ArtworkShare.create!(viewer_id: 1, artwork_id: 1)
ArtworkShare.create!(viewer_id: 10, artwork_id: 3)
ArtworkShare.create!(viewer_id: 9, artwork_id: 2)
ArtworkShare.create!(viewer_id: 8, artwork_id: 2)
ArtworkShare.create!(viewer_id: 4, artwork_id: 3)
ArtworkShare.create!(viewer_id: 4, artwork_id: 4)
#Comments
#body, user_id, artwork_id
Comment.create!(body: "smells like cabbage and dissapointment", user_id: 9, artwork_id: 3)
Comment.create!(body: "Cool artwowrk, bro!", user_id: 5, artwork_id: 1)
Comment.create!(body: "I could paint this better mate.", user_id: 8, artwork_id: 5)
Comment.create!(body: "gladius promised cake.  where is the cake", user_id: 3, artwork_id: 5)
Comment.create!(body: "where can i buy this?", user_id: 7, artwork_id: 4)
Comment.create!(body: "the paint is not dry yet", user_id: 2, artwork_id: 4)
Comment.create!(body: "T-bagging is not for making tea", user_id: 8, artwork_id: 1)