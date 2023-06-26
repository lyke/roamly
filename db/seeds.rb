require "open-uri"
Place.destroy_all
User.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

kevin_picture = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1687640247/IMG_1373_2_erzt1v.jpg")
user1 = User.new(
  email: "kevin@example.fr",
  password: "123456",
  nickname: "kev",
  first_name: "kevin",
  last_name: "ly"
)
user1.photo.attach(io: kevin_picture, filename: "Kevin profil picture", content_type: "image/jpg")
user1.save!

louhane_picture = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1687683578/sgjkebqbigwiufuuoecl_yfot8t.jpg")
user2 = User.new(
  email: "louhane@example.fr",
  password: "123456",
  nickname: "lou",
  first_name: "louhane",
  last_name: "maudet"
)
user2.photo.attach(io: louhane_picture, filename: "Louhane profil picture", content_type: "image/jpg")
user2.save!
 puts "user finished"
 puts "starting creating places"



eiffel_tower = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1687788252/development/6men4efzsrk3jv0wmaooost68n7h.jpg")
place1 = Place.new(
  name: "Eiffel Tower",
  description: "La tour Eiffel est une tour de fer puddlé de 330 m2 de hauteur (avec antennes) située à Paris, à l’extrémité nord-ouest du parc du Champ-de-Mars en bordure de la Seine dans le 7e arrondissement. Son adresse officielle est 5, avenue Anatole-France.
  Construite en deux ans par Gustave Eiffel et ses collaborateurs pour l'Exposition universelle de Paris de 1889, célébrant le centenaire de la Révolution française, et initialement nommée « tour de 300 mètres », elle est devenue le symbole de la capitale française et un site touristique de premier plan : il s’agit du quatrième site culturel français payant le plus visité en 2016, avec 5,9 millions de visiteurs3. Depuis son ouverture au public, elle a accueilli plus de 300 millions de visiteurs4.
  D’une hauteur de 312 mètreso 1 à l’origine, la tour Eiffel est restée le monument le plus élevé du monde pendant quarante ans. Le second niveau du troisième étage, appelé parfois quatrième étage, situé à 279,11 mètres, est la plus haute plateforme d'observation accessible au public de l'Union européenne et la deuxième plus haute d'Europe, derrière la tour Ostankino à Moscou culminant à 337 mètres. La hauteur de la tour a été plusieurs fois augmentée par l’installation d'un drapeau puis de nombreuses antennes, notamment en 1991, 1994, 2000 et 2022. Utilisée dans le passé pour de nombreuses expériences scientifiques, elle sert aujourd’hui d’émetteur de programmes radiophoniques et télévisés.",
  longitude: 2.294481,
  latitude: 48.858370,
  price: 26.20,
  duration: 90,
  secret_spot: false,
  user: User.first,
  min_temp: 0,
  max_temp: 40,
  touristic: true
)
place1.photos.attach(io: eiffel_tower, filename: "eiffel tower picture", content_type: "image/jpg")
place1.save!

cascade = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1687646016/pexels-willian-matiola-16476171_febcu6.jpg")
cascade2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1687788930/Cascade-de-la-Vis-660x400_k4i5er.jpg")
place2 = Place.new(
  name: "Cascade de la Vis",
  description: "Dès l’arrivée aux cascades, l’émerveillement est total, le paysage, les couleurs et la végétation rappellent les cartes postales de certaines îles tropicales !
  Les chutes font plus de quatre mètres de haut, il y a des cascades un peu partout, impossible de toutes les prendre en photo… j’espère que cette petite vidéo vous donnera un aperçu de la beauté du site.",
  longitude: 3.662937,
  latitude: 43.925711,
  price: 0,
  duration: 120,
  secret_spot: true,
  user: User.last,
  min_temp: 20,
  max_temp: 40,
  touristic: false
)
place2.photos.attach([{io: cascade, filename: "cascade picture", content_type: "image/jpg"},
                      {io: cascade2, filename: "eiffel tower picture", content_type: "image/jpg"}])
place2.save!
