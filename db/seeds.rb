require "open-uri"
TravelTagging.destroy_all
PlaceTag.destroy_all
TravelTag.destroy_all
Travel.destroy_all
PlaceTag.destroy_all
PlaceTravelerTypeTag.destroy_all
Place.destroy_all
User.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User :

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

alexandra_picture = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688042325/Screenshot_2023-06-29_at_2.38.18_PM_hzcsre.png")
user3 = User.new(
  email: "alexandra@example.fr",
  password: "123456",
  nickname: "alex",
  first_name: "alexandra",
  last_name: "delory"
)
user3.photo.attach(io: alexandra_picture, filename: "Alexandra profil picture", content_type: "image/png")
user3.save!


anastasiia_picture = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688042329/Screenshot_2023-06-29_at_2.38.27_PM_a9qxbm.png")
user4 = User.new(
  email: "anastasiia@example.fr",
  password: "123456",
  nickname: "nastya",
  first_name: "anastasiia",
  last_name: "deriabina"
)
user4.photo.attach(io: anastasiia_picture, filename: "Anastasiia profil picture", content_type: "image/png")
user4.save!





 puts "user finished"
 puts "starting creating places"

# Travel :

eiffel_tower = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1687788252/development/6men4efzsrk3jv0wmaooost68n7h.jpg")
eiffel_tower1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032871/pexels-adrianna-l-12651493_1_nzbfri.jpg")
eiffel_tower2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032860/pexels-leddso-dello-4438737_1_r0qmtq.jpg")

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
  touristic: true,
  address: "Champ de Mars, 5 Av. Anatole France, 75007 Paris"
)
place1.photos.attach([
    { io: eiffel_tower, filename: "ceiffel tower picture", content_type: "image/jpg" },
    { io: eiffel_tower1, filename: "eiffel tower picture", content_type: "image/jpg" },
    { io: eiffel_tower2, filename: "eiffel tower picture", content_type: "image/jpg" }])
place1.save!

louvre = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032809/pexels-pixabay-2363_uuc9ah.jpg")
louvre1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032744/pexels-created-stories-11258934_bd2gsr.jpg")
louvre2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032744/pexels-gustavo-ramos-7684045_ddcphy.jpg")
place2 = Place.new(
  name: "Louvre",
  description: "Dès l’arrivée aux cascades, l’émerveillement est total, le paysage, les couleurs et la végétation rappellent les cartes postales de certaines îles tropicales !
  Les chutes font plus de quatre mètres de haut, il y a des cascades un peu partout, impossible de toutes les prendre en photo… j’espère que cette petite vidéo vous donnera un aperçu de la beauté du site.",
  longitude: 2.338629,
  latitude: 48.860294,
  price: 17,
  duration: 120,
  secret_spot: true,
  user: User.last,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "20 Quai du Louvre, 75001 Paris"
)
place2.photos.attach([
  { io: louvre, filename: "louvre picture", content_type: "image/jpg" },
  { io: louvre1, filename: "louvre picture", content_type: "image/jpg" },
  { io: louvre2, filename: "louvre picture", content_type: "image/jpg" }])
place2.save!


arc = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032809/pexels-pixabay-2344_n2pnfe.jpg")
arc1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032809/pexels-mitchell-henderson-16538824_cita5w.jpg")
arc2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688033733/pexels-vinnie-de-carvalho-10216015_gssn0a.jpg")
place3 = Place.new(
  name: "Arc de Triomphe",
  description: "Dès l’arrivée aux cascades, l’émerveillement est total, le paysage, les couleurs et la végétation rappellent les cartes postales de certaines îles tropicales !
  Les chutes font plus de quatre mètres de haut, il y a des cascades un peu partout, impossible de toutes les prendre en photo… j’espère que cette petite vidéo vous donnera un aperçu de la beauté du site.",
  longitude: 2.2950,
  latitude: 48.8738,
  price: 17,
  duration: 120,
  secret_spot: true,
  user: User.last,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Pl. Charles de Gaulle, 75008 Paris"
)
place3.photos.attach([
  { io: arc, filename: "arc picture", content_type: "image/jpg" },
  { io: arc1, filename: "arc picture", content_type: "image/jpg" },
  { io: arc2, filename: "arc picture", content_type: "image/jpg" }])
place3.save!


palais = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032708/4283847d1cda8f52caa16f5670d0a551eaaae77d-428384-1200-627-crop_qvr2g3.jpg")
palais1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032772/pexels-maria-orlova-4947561_1_kxqxgj.jpg")
palais2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032709/palais-royal_qwa9sl.jpg")
place4 = Place.new(
  name: "Palais-Royal",
  description: "Dès l’arrivée aux cascades, l’émerveillement est total, le paysage, les couleurs et la végétation rappellent les cartes postales de certaines îles tropicales !
  Les chutes font plus de quatre mètres de haut, il y a des cascades un peu partout, impossible de toutes les prendre en photo… j’espère que cette petite vidéo vous donnera un aperçu de la beauté du site.",
  longitude: 2.121782,
  latitude: 48.804722,
  price: 0,
  duration: 120,
  secret_spot: true,
  user: User.last,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "8 Rue de Montpensier, 75001 Paris"
)
place4.photos.attach([
  { io: palais, filename: "palais picture", content_type: "image/jpg" },
  { io: palais1, filename: "palais picture", content_type: "image/jpg" },
  { io: palais2, filename: "palais picture", content_type: "image/jpg" }])
place4.save!

jardin = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032708/479489-visuel-paris-jardin-du-luxembourg_ljay4l.jpg")
jardin1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032708/jardin-du-luxembourg-GettyImages-151514883_lpidm0.webp")
jardin2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032810/walk-through-jardin-du-luxembourg-fall-scene_n3sj8y.jpg")
place5 = Place.new(
  name: "Jardin du Luxembourg",
  description: "Dès l’arrivée aux cascades, l’émerveillement est total, le paysage, les couleurs et la végétation rappellent les cartes postales de certaines îles tropicales !
  Les chutes font plus de quatre mètres de haut, il y a des cascades un peu partout, impossible de toutes les prendre en photo… j’espère que cette petite vidéo vous donnera un aperçu de la beauté du site.",
  longitude: 2.121782,
  latitude: 48.846943,
  price: 0,
  duration: 120,
  secret_spot: true,
  user: User.last,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Rue de Vaugirard, 75006 Paris"
)
place5.photos.attach([
  { io: jardin, filename: "jardin picture", content_type: "image/jpg" },
  { io: jardin1, filename: "jardin picture", content_type: "image/webp" },
  { io: jardin2, filename: "jardin picture", content_type: "image/jpg" }])
place5.save!


chateau = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688035094/pexels-joan-costa-13692199_ux6acf.jpg")
chateau1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688035106/orangerie-jardins-parc-chateau-versailles-jcl2_hz4lzf.jpg")
chateau2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688035084/1000_F_394723989_cINhVWQW91yzFjAKw4jcXA7wDnujJnml_l8eanl.jpg")
place6 = Place.new(
  name: "Château de Versailles",
  description: "Dès l’arrivée aux cascades, l’émerveillement est total, le paysage, les couleurs et la végétation rappellent les cartes postales de certaines îles tropicales !
  Les chutes font plus de quatre mètres de haut, il y a des cascades un peu partout, impossible de toutes les prendre en photo… j’espère que cette petite vidéo vous donnera un aperçu de la beauté du site.",
  longitude: 4.860201,
  latitude: 45.748112,
  price: 20,
  duration: 120,
  secret_spot: true,
  user: User.last,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Place d'Armes, 78000 Versailles"
)
place6.photos.attach([
  { io: chateau, filename: "chateau picture", content_type: "image/jpg" },
  { io: chateau1, filename: "chateau picture", content_type: "image/jpg" },
  { io: chateau2, filename: "chateau picture", content_type: "image/jpg" }])
place6.save!

coeur = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688034517/pexels-antonio-filigno-7939412_kgucba.jpg")
coeur1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688034534/pexels-julia-volk-5273508_ww37gi.jpg")
coeur2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688034567/pexels-pierre-blache%CC%81-9701151_htbcbu.jpg")
place7 = Place.new(
  name: "Basilique du Sacré-Cœur",
  description: "Dès l’arrivée aux cascades, l’émerveillement est total, le paysage, les couleurs et la végétation rappellent les cartes postales de certaines îles tropicales !
  Les chutes font plus de quatre mètres de haut, il y a des cascades un peu partout, impossible de toutes les prendre en photo… j’espère que cette petite vidéo vous donnera un aperçu de la beauté du site.",
  longitude: 2.343121,
  latitude: 48.886452,
  price: 0,
  duration: 120,
  secret_spot: true,
  user: User.last,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "35 Chevalier de La Barre, 75018 Paris"
)
place7.photos.attach([
  { io: coeur, filename: "coeur picture", content_type: "image/jpg" },
  { io: coeur1, filename: "coeur picture", content_type: "image/jpg" },
  { io: coeur2, filename: "coeur picture", content_type: "image/jpg" }])
place7.save!


petit = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688035876/pete-palais-facade-2018-08-10-3430-mc-800-2x1_lv8hsb.jpg")
petit1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688035867/747183-le-jardin-du-petit-palais-et-sa-terrasse-verdoyante_oxs3et.jpg")
petit2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688035859/866406-petit-palais-collection-permanente-jardin_movk8y.jpg")
place8 = Place.new(
  name: "Petit Palais",
  description: "Dès l’arrivée aux cascades, l’émerveillement est total, le paysage, les couleurs et la végétation rappellent les cartes postales de certaines îles tropicales !
  Les chutes font plus de quatre mètres de haut, il y a des cascades un peu partout, impossible de toutes les prendre en photo… j’espère que cette petite vidéo vous donnera un aperçu de la beauté du site.",
  longitude: 2.31451,
  latitude: 48.86605,
  price: 15,
  duration: 120,
  secret_spot: true,
  user: User.last,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Avenue Winston-Churchill, 75008 Paris"
)
place8.photos.attach([
  { io: petit, filename: "petit picture", content_type: "image/jpg" },
  { io: petit1, filename: "petit picture", content_type: "image/jpg" },
  { io: petit2, filename: "petit picture", content_type: "image/jpg" }])
place8.save!


dame = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688035930/pexels-adrienn-1460145_wkmv6z.jpg")
dame1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688035900/pexels-xiaoyu-chen-632628_v2igar.jpg")
dame2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688035885/pexels-hans-d-10915270_inwfkp.jpg")
place9 = Place.new(
  name: "Cathédrale Notre-Dame de Paris",
  description: "Dès l’arrivée aux cascades, l’émerveillement est total, le paysage, les couleurs et la végétation rappellent les cartes postales de certaines îles tropicales !
  Les chutes font plus de quatre mètres de haut, il y a des cascades un peu partout, impossible de toutes les prendre en photo… j’espère que cette petite vidéo vous donnera un aperçu de la beauté du site.",
  longitude: 2.349902,
  latitude: 48.852966,
  price: 0,
  duration: 120,
  secret_spot: true,
  user: User.last,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris"
)
place9.photos.attach([
  { io: dame, filename: "dame picture", content_type: "image/jpg" },
  { io: dame1, filename: "dame picture", content_type: "image/jpg" },
  { io: dame2, filename: "dame picture", content_type: "image/jpg" }])
place9.save!

opera = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688036103/ROCAMAT-Opera-Garnier-photographe-JP-Delagarde-pierre-Euville-04-scaled-min_1_1_ftgmut.jpg")
opera1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688035913/pexels-masood-aslami-14960325_jcyt7y.jpg")
opera2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688035854/E._Bauer___Opera_national_de_Paris-Garnier--E.-Bauer-OnP_mg3jek.webp")
place10 = Place.new(
  name: "Palais Garnier",
  description: "Dès l’arrivée aux cascades, l’émerveillement est total, le paysage, les couleurs et la végétation rappellent les cartes postales de certaines îles tropicales !
  Les chutes font plus de quatre mètres de haut, il y a des cascades un peu partout, impossible de toutes les prendre en photo… j’espère que cette petite vidéo vous donnera un aperçu de la beauté du site.",
  longitude: 2.331355,
  latitude: 48.872536,
  price: 14,
  duration: 120,
  secret_spot: true,
  user: User.last,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Pl. de l'Opéra, 75009 Paris"
)
place10.photos.attach([
  { io: opera, filename: "opera picture", content_type: "image/jpg" },
  { io: opera1, filename: "opera picture", content_type: "image/jpg" },
  { io: opera2, filename: "opera picture", content_type: "image/webp" }])
place10.save!


pl_tr_ty_tags = ["Seul", "En Couple", "En Famille", "Entre Amis"]
pl_tr_ty_tags.each do |tag|
  PlaceTravelerTypeTag.create(tag: tag)
end

place_tags = ["Art et Culture", "Sport", "Shopping", "Vie Nocturne", "Détente et Spa", "Histoire", "Aventure", "Nourriture", "Nature", "Spectacle", "Escapade Romantique", "Parc d'attraction"]
place_tags.each do |place_tag|
  PlaceTag.create(name: place_tag)
end

Travel.create(
  user: User.first,
  beginning_date: "2023-06-27",
  ending_date: "2023-06-27",
  starting_point: "1 avenue des champs elysées, Paris",
  nb_traveler: 2,
  budget: 150,
  local_temperature: 30,
  start_hour: "2023-06-27.10:00:00",
  end_hour: "2023-06-27.20:00:00"
)

# TravelTag :

travel_tags = ["Art et Culture", "Sport", "Shopping", "Vie Nocturne", "Détente et Spa", "Histoire", "Aventure", "Nourriture", "Nature", "Spectacle", "Escapade Romantique", "Parc d'attraction"]
travel_tags.each do |tag|
  TravelTag.create(name: tag)
end

place_tags = ["Art et Culture", "Sport", "Shopping", "Vie Nocturne", "Détente et Spa", "Histoire", "Aventure", "Nourriture", "Nature", "Spectacle", "Escapade Romantique", "Parc d'attraction"]
place_tags.each do |tag|
  PlaceTag.create(name: tag)
end

# TravelTagging :

TravelTagging.create(
  travel: Travel.first,
  travel_tag: TravelTag.first
)
TravelTagging.create(
  travel: Travel.last,
  travel_tag: TravelTag.last
)

# TravTravTagging :
TravTravTagging.create(
  travel: Travel.first,
  trav_trav_type_tag: TravTravTypeTag.first
)

TravTravTagging.create(
  travel: Travel.last,
  trav_trav_type_tag: TravTravTypeTag.last
)

# TravTravTypeTag :
traveler_types = ["Seul", "En Couple", "En Famille", "Entre Amis"]
traveler_types.each do |trav_type|
  TravTravTypeTag.create(name: trav_type)
end
