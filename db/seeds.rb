require "open-uri"
TravTravTagging.destroy_all
PlaceTravTagging.destroy_all
TravelTagging.destroy_all
PlaceTagging.destroy_all

TravelTag.destroy_all
PlaceTag.destroy_all
TravTravTypeTag.destroy_all
PlaceTravelerTypeTag.destroy_all
Step.destroy_all

Travel.destroy_all
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
  last_name: "maudet",
  admin: true
)
user2.photo.attach(io: louhane_picture, filename: "Louhane profil picture", content_type: "image/jpg")
user2.save!

alexandra_picture = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688042325/Screenshot_2023-06-29_at_2.38.18_PM_hzcsre.png")
user3 = User.new(
  email: "alexandra@example.fr",
  password: "123456",
  nickname: "alex",
  first_name: "alexandra",
  last_name: "delory",
  admin: true
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

 # TravTravTypeTag :
traveler_types = ["Seul", "En Couple", "En Famille", "Entre Amis"]
traveler_types.each do |trav_type|
  TravTravTypeTag.create(name: trav_type)
end

# TravelTag :

travel_tags = ["Art et Culture", "Sport", "Shopping", "Vie Nocturne", "Détente et Spa", "Histoire", "Aventure", "Nourriture", "Nature", "Spectacle", "Escapade Romantique", "Parc d'attraction"]
travel_tags.each do |tag|
  TravelTag.create(name: tag)
end

pl_tr_ty_tags = ["Seul", "En Couple", "En Famille", "Entre Amis"]
pl_tr_ty_tags.each do |tag|
  PlaceTravelerTypeTag.create(tag: tag)
end

place_tags = ["Art et Culture", "Sport", "Shopping", "Vie Nocturne", "Détente et Spa", "Histoire", "Aventure", "Nourriture", "Nature", "Spectacle", "Escapade Romantique", "Parc d'attraction"]
place_tags.each do |place_tag|
  PlaceTag.create(name: place_tag)
end

puts "tag finished"

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
  user: user2,
  min_temp: 0,
  max_temp: 40,
  touristic: true,
  address: "Champ de Mars, 5 Av. Anatole France, 75007 Paris",
  validation: true
)
# place_tags = PlaceTag.where(name: ["Art et Culture", "Escapade Romantique", "Histoire"])
# place_tags.each do |place_tag|
#   place_tagging = PlaceTagging.new(place: place1, place_tag: place_tag)
#   place1.place_taggings << place_tagging
# end

place1.place_tags << PlaceTag.where(name: ["Art et Culture", "Escapade Romantique", "Histoire"])
place1.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])
# place_tags.each do |place_tag|
#   place1.place_tags << place_tag
# end

place1.photos.attach([
    { io: eiffel_tower, filename: "eiffel tower picture", content_type: "image/jpg" },
    { io: eiffel_tower1, filename: "eiffel tower picture", content_type: "image/jpg" },
    { io: eiffel_tower2, filename: "eiffel tower picture", content_type: "image/jpg" }])
place1.save!

louvre = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032809/pexels-pixabay-2363_uuc9ah.jpg")
louvre1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032744/pexels-created-stories-11258934_bd2gsr.jpg")
louvre2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688032744/pexels-gustavo-ramos-7684045_ddcphy.jpg")
place2 = Place.new(
  name: "Louvre",
  description: "Le Louvre, joyau culturel de Paris, abrite une collection d'œuvres d'art époustouflante. Des chefs-d'œuvre tels que la Joconde, la Vénus de Milo et la Victoire de Samothrace y résident. Ce palais historique, avec son architecture grandiose et ses salles majestueuses, offre aux visiteurs une expérience artistique inoubliable. Un voyage au cœur de l'histoire et de la beauté, le musée du Louvre est un trésor inestimable de l'humanité.",
  longitude: 2.338629,
  latitude: 48.860294,
  price: 17,
  duration: 120,
  secret_spot: false,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "20 Quai du Louvre, 75001 Paris",
  validation: true
)
place2.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire"])
place2.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

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
  description: "L'Arc de Triomphe, majestueux monument parisien, domine la célèbre avenue des Champs-Élysées. Symbole de grandeur et de victoire, il rend hommage aux soldats français. Son architecture imposante et ses bas-reliefs captivants racontent l'histoire de la nation. Du sommet, la vue panoramique sur la ville de Paris est à couper le souffle. L'Arc de Triomphe incarne la fierté, la mémoire et l'élégance de la capitale française.",
  longitude: 2.2950,
  latitude: 48.8738,
  price: 17,
  duration: 120,
  secret_spot: false,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Pl. Charles de Gaulle, 75008 Paris",
  validation: true
)
place3.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire"])
place3.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

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
  description: "Le palais royal, situé au cœur de la ville, est un chef-d'œuvre architectural chargé d'histoire et de prestige. Avec ses somptueuses salles ornées de dorures, de fresques et de lustres étincelants, il incarne l'opulence et le pouvoir. Les jardins somptueux qui l'entourent offrent une oasis de tranquillité. En son sein, les couloirs regorgent de secrets et de souvenirs royaux. Le palais royal est un témoin vivant du passé glorieux et un symbole de grandeur intemporelle.",
  longitude: 2.121782,
  latitude: 48.804722,
  price: 0,
  duration: 120,
  secret_spot: false,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "8 Rue de Montpensier, 75001 Paris"
)
place4.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire", "Spectacle"])
place4.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

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
  description: "Le jardin du Luxembourg, havre de paix en plein cœur de Paris, enchante par sa beauté sereine. Ses étendues verdoyantes, ses parterres fleuris et ses allées ombragées invitent à la détente. Les statues, les fontaines et le bassin central créent une atmosphère élégante et paisible. Les chaises vertes offrent un lieu idéal pour se reposer et admirer la vue sur le palais. Ce jardin emblématique est un véritable joyau, un refuge enchanteur où règne la tranquillité au milieu de l'effervescence urbaine.",
  longitude: 2.121782,
  latitude: 48.846943,
  price: 0,
  duration: 120,
  secret_spot: false,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Rue de Vaugirard, 75006 Paris",
  validation: true
)
place5.place_tags << PlaceTag.where(name: ["Nature", "Escapade Romantique"])
place5.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

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
  description: "Le château de Versailles, chef-d'œuvre du classicisme français, éblouit par son architecture grandiose et ses jardins somptueux. Les salons royaux, richement décorés de lustres et de peintures, témoignent de l'opulence de la cour de Louis XIV. Les jardins à la française, avec leurs parterres impeccables et leurs fontaines élégantes, offrent une symphonie de beauté. Le château de Versailles est un témoignage vivant de la grandeur passée et un incontournable de l'histoire et de l'art français.",
  longitude: 4.860201,
  latitude: 45.748112,
  price: 20,
  duration: 120,
  secret_spot: false,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Place d'Armes, 78000 Versailles",
  validation: true
)
place6.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire", "Spectacle"])
place6.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

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
  description: "La basilique du Sacré-Cœur, majestueusement perchée sur la butte Montmartre, offre une vue panoramique imprenable sur Paris. Son architecture romano-byzantine et son dôme blanc étincelant captivent le regard. À l'intérieur, la lumière baigne les mosaïques vibrantes et les vitraux colorés, créant une ambiance spirituelle. Cette icône religieuse incarne la ferveur et la dévotion, tout en étant un symbole d'unité et de paix pour les visiteurs du monde entier.",
  longitude: 2.343121,
  latitude: 48.886452,
  price: 0,
  duration: 120,
  secret_spot: false,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "35 Chevalier de La Barre, 75018 Paris",
  validation: true
)
place7.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire", "Escapade Romantique"])
place7.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

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
  description: "Le Petit Palais, joyau architectural de Paris, enchante par sa finesse et sa splendeur. Ses façades ornées, ses colonnes élégantes et son dôme majestueux captivent les regards. À l'intérieur, des galeries lumineuses abritent une collection d'art éclectique, allant de la Renaissance à l'Art Nouveau. Les jardins pittoresques offrent une oasis de calme et de verdure au cœur de la ville. Le Petit Palais est un trésor artistique qui séduit par son charme intemporel et son atmosphère raffinée.",
  longitude: 2.31451,
  latitude: 48.86605,
  price: 15,
  duration: 120,
  secret_spot: false,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Avenue Winston-Churchill, 75008 Paris",
  validation: true
)
place8.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire", "Escapade Romantique"])
place8.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

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
  description: "La majestueuse cathédrale Notre-Dame de Paris, chef-d'œuvre gothique emblématique, incarne l'histoire et la spiritualité. Ses imposantes tours, ses gargouilles et ses rosaces captivent les esprits. À l'intérieur, les voûtes élancées et les vitraux colorés créent une atmosphère divine. Le parvis animé et les bords de la Seine ajoutent à son charme. Témoin des siècles, Notre-Dame est un symbole intemporel de la culture et de la foi, un lieu où l'âme de Paris résonne dans chaque pierre.",
  longitude: 2.349902,
  latitude: 48.852966,
  price: 0,
  duration: 120,
  secret_spot: false,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris",
  validation: true
)
place9.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire"])
place9.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

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
  description: "Le Palais Garnier, somptueux opéra de Paris, est une merveille architecturale. Sa façade ornée de sculptures et de colonnes séduit dès le premier regard. À l'intérieur, le grand escalier en marbre, les balcons richement décorés et le lustre de cristal créent une atmosphère théâtrale. La salle de spectacle, avec son plafond peint par Chagall, enchante les spectateurs. Le Palais Garnier est un véritable joyau artistique où l'opéra et l'opulence se rencontrent dans une harmonie éblouissante.",
  longitude: 2.331355,
  latitude: 48.872536,
  price: 14,
  duration: 120,
  secret_spot: false,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Pl. de l'Opéra, 75009 Paris",
  validation: true
)
place10.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire", "Spectacle", "Escapade Romantique"])
place10.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place10.photos.attach([
  { io: opera, filename: "opera picture", content_type: "image/jpg" },
  { io: opera1, filename: "opera picture", content_type: "image/jpg" },
  { io: opera2, filename: "opera picture", content_type: "image/webp" }])
place10.save!

rue = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688115529/image_wtnk5t.jpg")
rue1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688115529/29738802_wxqmae.webp")
rue2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688115529/shutterstock_730699129_vgorlk.jpg")
place11 = Place.new(
  name: "Rue Crémieux",
  description: "La rue Crémieux, joyau coloré du quartier de Bastille à Paris, émerveille par son charme unique. Ses maisons aux façades pastel et aux volets colorés créent une atmosphère enchantée. Les fleurs grimpantes et les jardinières ajoutent une touche de poésie. Cette rue piétonne, bordée d'arbres et d'escaliers en fer forgé, respire la tranquillité. Un véritable refuge de calme et de beauté au cœur de la ville animée, la rue Crémieux est une invitation à la flânerie et à la contemplation.",
  longitude: 2.3700633,
  latitude: 48.8463887,
  price: 0,
  duration: 120,
  secret_spot: true,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Rue Crémieux, 75012 Paris",
  validation: true
)
place11.place_tags << PlaceTag.where(name: ["Art et Culture"])
place11.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place11.photos.attach([
  { io: rue, filename: "rue picture", content_type: "image/jpg" },
  { io: rue1, filename: "rue picture", content_type: "image/webp" },
  { io: rue2, filename: "rue picture", content_type: "image/jpg" }])
place11.save!

parc = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688115529/5c2188b4-fd30-4801-8a78-6921f09a0d57_ithb6i.webp")
parc1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688115529/buttes-chaumont-paris_yannis-sommera_ipiwdq.jpg")
parc2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688115529/36644370903_c864d6d078_o_wq9dih.jpg")
place12 = Place.new(
  name: "Parc des Buttes-Chaumont",
  description: "Le Parc des Buttes-Chaumont, oasis naturelle nichée au cœur de Paris, émerveille par sa beauté pittoresque. Ses collines verdoyantes, son lac paisible et son île romantique captivent les promeneurs. Les cascades gracieuses et les grottes mystérieuses ajoutent une touche d'aventure. Les jardins à la française et les sentiers sinueux offrent des vues panoramiques sur la ville. Ce parc bucolique, avec ses ponts élégants et ses arbres majestueux, est une échappée enchantée où règne la sérénité et la quiétude.",
  longitude: 2.382761,
  latitude: 48.880950,
  price: 0,
  duration: 120,
  secret_spot: true,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "1 Rue Botzaris, 75019 Paris",
  validation: true
)
place12.place_tags << PlaceTag.where(name: ["Nature", "Escapade Romantique"])
place12.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place12.photos.attach([
  { io: parc, filename: "parc picture", content_type: "image/webp" },
  { io: parc1, filename: "parc picture", content_type: "image/jpg" },
  { io: parc2, filename: "parc picture", content_type: "image/jpg" }])
place12.save!

square = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688116608/square-vert-galant_sfqawf.jpg")
square1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688116624/paris_gcjbns.jpg")
square2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688116635/1sq_vgal2_yp0gfc.jpg")
place13 = Place.new(
  name: "Square du Vert-Galant",
  description: "Le Square du Vert-Galant, niché sur l'île de la Cité, offre une évasion paisible au cœur de Paris. Ce jardin pittoresque, en bord de Seine, dévoile une vue imprenable sur le fleuve et les ponts emblématiques. Ses pelouses verdoyantes, ses arbres ombragés et ses bancs invitent à la détente. L'atmosphère romantique et sereine du lieu en fait un refuge idéal pour les promeneurs en quête de tranquillité. Le Square du Vert-Galant est un havre de verdure et de quiétude, où l'on peut s'évader du tumulte urbain environnant.",
  longitude: 2.340168,
  latitude:  48.857487,
  price: 0,
  duration: 120,
  secret_spot: true,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "15 Pl. du Pont Neuf, 75001 Paris",
  validation: true
)
place13.place_tags << PlaceTag.where(name: ["Nature", "Escapade Romantique"])
place13.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place13.photos.attach([
  { io: square, filename: "square picture", content_type: "image/jpg" },
  { io: square1, filename: "square picture", content_type: "image/jpg" },
  { io: square2, filename: "square picture", content_type: "image/jpg" }])
place13.save!


butte = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688116639/cdec_bvylq2.webp")
butte1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688116635/butte-bergeyre-paris-1_hlpwmv.jpg")
butte2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688116624/butte-bergeyre-balade-paris_i6sfgg.jpg")
place14 = Place.new(
  name: "La Butte Bergeyre",
  description: "La Butte Bergeyre, dans le 19e arrondissement de Paris, est un joli village caché. Ses rues pavées serpentent à 100 mètres d'altitude, offrant des vues panoramiques sur les toits parisiens. Anciennement un vignoble, le quartier conserve son charme avec ses maisons colorées et ses façades fleuries. Cette enclave paisible permet une promenade reposante et authentique, loin de l'agitation urbaine. Découvrez ce joyau caché, un havre de paix au cœur de la ville lumière.",
  longitude: 2.37564,
  latitude: 48.8772,
  price: 0,
  duration: 120,
  secret_spot: true,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "78 Rue Georges Lardennois, 75019 Paris"
)
place14.place_tags << PlaceTag.where(name: ["Nature"])
place14.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place14.photos.attach([
  { io: butte, filename: "butte picture", content_type: "image/webp" },
  { io: butte1, filename: "butte picture", content_type: "image/jpg" },
  { io: butte2, filename: "butte picture", content_type: "image/jpg" }])
place14.save!

villa = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688116608/villa-le%CC%81andre-montmartre-03_m0l9k6.jpg")
villa1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688116608/villa-leandre-montmartre-paris-18-128811634194843125205.jpg_buopqn.webp")
villa2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688116608/villa_leandre_montmartre_paris-1024x683.jpg_pagnpo.webp")
place15 = Place.new(
  name: "Le Villa Léandre",
  description: "La Villa Léandre est une magnifique résidence située dans le quartier pittoresque de Montmartre à Paris. Cette villa historique incarne à la fois le charme de l'architecture parisienne traditionnelle et une élégance contemporaine.
  La Villa Léandre offre un cadre enchanteur avec ses jardins luxuriants et sa tranquillité préservée, loin de l'agitation de la ville. Chaque détail de cette demeure a été soigneusement pensé pour créer une atmosphère de raffinement et de confort.",
  longitude: 2.335057,
  latitude: 48.888378,
  price: 0,
  duration: 120,
  secret_spot: true,
  user: user1,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Avenue Junot, 75018 Paris"
)
place15.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire"])
place15.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place15.photos.attach([
  { io: villa, filename: "villa picture", content_type: "image/jpg" },
  { io: villa1, filename: "villa picture", content_type: "image/webp" },
  { io: villa2, filename: "villa picture", content_type: "image/webp" }])
place15.save!

# place Marseille

vieuxport = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688548813/Old_port_of_Marseille_za9ps8.jpg")
vieuxport1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688548813/1408_3XZ2e_v_viyhxm.jpg")
vieuxport2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688548813/ima-image-34189_r0u3kf.jpg")
place34 = Place.new(
  name: "Le Vieux Port",
  description: "Le Vieux-Port de Marseille, joyau méditerranéen, berceau de l'histoire et de l'authenticité provençale. Les bateaux colorés dansent au rythme des vagues tandis que les ruelles pittoresques révèlent les parfums envoûtants de la bouillabaisse et du pastis. Un lieu où passé et présent se rencontrent, offrant une atmosphère unique et un charme intemporel.",
  longitude: 5.371370,
  latitude: 43.296191,
  price: 0,
  duration: 60,
  secret_spot: false,
  user: user2,
  min_temp: 15,
  max_temp: 40,
  touristic: true,
  address: "Quai des Belges, 13001 Marseille",
  validation: true
)
place34.place_tags << PlaceTag.where(name: ["Nourriture", "Histoire"])
place34.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place34.photos.attach([
  { io: vieuxport, filename: "vieuxport picture", content_type: "image/jpg" },
  { io: vieuxport1, filename: "vieuxport picture", content_type: "image/webp" },
  { io: vieuxport2, filename: "vieuxport picture", content_type: "image/webp" }])
place34.save!

notredame = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688549011/bonne-mere-ok-1-e1643907235539_i7yz8j.jpg")
notredame1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688549011/ndg-vue-deposit_bczifp.webp")
notredame2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688549011/det_notre-dame-de-la-garde-marseille_BR_ksc7q7.jpg")
place35 = Place.new(
  name: "La Bonne Mère",
  description: "La Bonne Mère, majestueuse sentinelle surplombant Marseille, symbole de foi et de protection. Sa silhouette élégante domine la ville, offrant une vue panoramique à couper le souffle. Les pèlerins et les visiteurs y trouvent réconfort et inspiration, tandis que sa présence bienveillante veille sur les habitants. Un monument emblématique qui incarne l'âme et l'esprit de Marseille.",
  longitude: 5.371238,
  latitude: 43.283953,
  price: 0,
  duration: 30,
  secret_spot: false,
  user: user2,
  min_temp: 10,
  max_temp: 30,
  touristic: true,
  address: "Rue Fort du Sanctuaire, 13006 Marseille",
  validation: true
)
place35.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire"])
place35.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place35.photos.attach([
  { io: notredame, filename: "notredame picture", content_type: "image/jpg" },
  { io: notredame1, filename: "notredame picture", content_type: "image/webp" },
  { io: notredame2, filename: "notredame picture", content_type: "image/webp" }])
place35.save!

plage = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688549640/plage-de-la-verrerie-plage-de-bonne-brise-plage-a-dede-marseille-25_sets8b.jpg")
plage1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688549639/plage-de-la-verrerie-plage-de-bonne-brise-plage-a-dede-marseille-29-848x566_nykw5g.jpg")
plage2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688549639/2061_tw5kd2.jpg")
place36 = Place.new(
  name: "Plage de la Bonne Brise",
  description: "La plage de la Bonne Brise à Marseille, paradis balnéaire où sable doré et eaux turquoises se rencontrent harmonieusement. Bordée de palmiers et baignée de douces brises marines, elle offre un havre de détente et de plaisir. Les amateurs de baignade, de sports nautiques ou de farniente y trouveront leur bonheur. Un lieu envoûtant où la magie de la Méditerranée opère, invitant chacun à profiter de moments inoubliables au bord de l'eau.",
  longitude: 5.359929,
  latitude: 43.235411,
  price: 0,
  duration: 240,
  secret_spot: true,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "32 Boulevard Bonne Brise, 13008 Marseille",
  validation: true
)
place36.place_tags << PlaceTag.where(name: ["Détente et Spa", "Nature", "Histoire"])
place36.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place36.photos.attach([
  { io: plage, filename: "plage picture", content_type: "image/jpg" },
  { io: plage1, filename: "plage picture", content_type: "image/webp" },
  { io: plage2, filename: "plage picture", content_type: "image/webp" }])
place36.save!

longchamp = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688550102/palais-longchamp-leotcm-1920x960_l5r77l.jpg")
longchamp1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688550102/image_lkztxq.jpg")
longchamp2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688550102/20191213_1_6_6_1_0_obj21722552_1.jpg_iwda56.webp")
place37 = Place.new(
  name: "Le Palais Longchamp",
  description: "Le palais Longchamp, majestueux édifice au cœur de Marseille, incarne l'élégance et le prestige. Ses colonnes imposantes encadrent une fontaine spectaculaire, tandis que ses jardins verdoyants invitent à la contemplation. Témoin de l'histoire et de l'art, ce monument emblématique offre un cadre enchanteur pour les promenades et les événements culturels. Un lieu où l'architecture grandiose et la nature luxuriante se conjuguent pour offrir une expérience captivante et mémorable.",
  longitude: 5.394603,
  latitude: 43.304267,
  price: 0,
  duration: 60,
  secret_spot: false,
  user: user2,
  min_temp: 10,
  max_temp: 30,
  touristic: true,
  address: "Boulevard Jard. Zoologique, 13004 Marseille",
  validation: true
)
place37.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire"])
place37.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place37.photos.attach([
  { io: longchamp, filename: "longchamp picture", content_type: "image/jpg" },
  { io: longchamp1, filename: "longchamp picture", content_type: "image/webp" },
  { io: longchamp2, filename: "longchamp picture", content_type: "image/webp" }])
place37.save!

calanques = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688551222/sormiou_e4i8uy.jpg")
calanques1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688551222/10844339.jpg_k57isz.webp")
calanques2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688551222/calanque-sormiou-640x640_ti3od7.jpg")
place38 = Place.new(
  name: "Calanque de Sormiou",
  description: "La calanque de Sormiou, joyau naturel préservé près de Marseille, enchante par ses eaux cristallines et ses falaises imposantes. Ce paradis sauvage invite à l'évasion, offrant des sentiers de randonnée pittoresques et des plages isolées. Les amoureux de la nature trouveront ici un sanctuaire préservé, où la beauté brute de la Méditerranée se mêle à la tranquillité absolue. Une expérience unique qui éveille les sens et laisse des souvenirs indélébiles.",
  longitude: 5.421875,
  latitude: 43.209557,
  price: 0,
  duration: 240,
  secret_spot: false,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: true,
  address: "11 Boulevard Vaucanson, 13009 Marseille",
  validation: true
)
place38.place_tags << PlaceTag.where(name: ["Aventure", "Nature", "Sport"])
place38.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place38.photos.attach([
  { io: calanques, filename: "calanques picture", content_type: "image/jpg" },
  { io: calanques1, filename: "calanques picture", content_type: "image/webp" },
  { io: calanques2, filename: "calanques picture", content_type: "image/webp" }])
place38.save!

terrasseport = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688551922/2925_g8uho8.jpg")
terrasseport1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688551923/2449x1632_sie8ft.jpg")
terrasseport2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688551923/les-terrasses-du-port-007.jpg_fnehmz.webp")
place39 = Place.new(
  name: "Les Terrasses du Port",
  description: "Les Terrasses du Port, oasis urbaine contemporaine à Marseille, offrent une vue imprenable sur la mer Méditerranée. Avec leur architecture moderne et leurs espaces ouverts, elles invitent à la détente et à la flânerie. Les boutiques tendance, les restaurants raffinés et les terrasses animées créent une atmosphère vibrante et conviviale. Un lieu où shopping, gastronomie et panorama spectaculaire se rejoignent pour créer une expérience unique au cœur de la ville.",
  longitude: 5.364598,
  latitude: 43.306758,
  price: 0,
  duration: 240,
  secret_spot: false,
  user: user2,
  min_temp: 0,
  max_temp: 40,
  touristic: true,
  address: "9 Quai du Lazaret, 13002 Marseille",
  validation: true
)
place39.place_tags << PlaceTag.where(name: ["Shopping"])
place39.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place39.photos.attach([
  { io: terrasseport, filename: "terrasses picture", content_type: "image/jpg" },
  { io: terrasseport1, filename: "terrasses picture", content_type: "image/webp" },
  { io: terrasseport2, filename: "terrasses picture", content_type: "image/webp" }])
place39.save!

lesgoudes = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688552116/hemaposesesvalises.fr_marseille_les_goudes_cap_croisette_ile_maire_yqfm5k.jpg")
lesgoudes1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688552116/bateaux-a-sec-goudes_fwvs0i.jpg")
lesgoudes2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688552115/68ca6c_d80942763489415cb4528b9cff78ba2f_mv2.jpg_xoftxz.webp")
place40 = Place.new(
  name: "Les Goudes",
  description: "Les Goudes, petit village de pêcheurs pittoresque aux portes de Marseille, éblouit par son charme authentique. Ses maisons colorées se nichent entre les collines et les eaux turquoise, offrant une atmosphère paisible et un cadre idyllique. Les criques secrètes invitent à la baignade et à la plongée, tandis que les restaurants de fruits de mer servent des délices culinaires frais. Un refuge préservé où l'on peut profiter de la beauté naturelle de la Méditerranée et du rythme tranquille de la vie méditerranéenne.",
  longitude: 5.346570,
  latitude: 43.215287,
  price: 0,
  duration: 240,
  secret_spot: true,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: false,
  address: "Boulevard Alexandre Delabre 13008 Marseille",
  validation: true
)
place40.place_tags << PlaceTag.where(name: ["Nature", "Aventure", "Histoire"])
place40.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place40.photos.attach([
  { io: lesgoudes, filename: "goudes picture", content_type: "image/jpg" },
  { io: lesgoudes1, filename: "goudes picture", content_type: "image/webp" },
  { io: lesgoudes2, filename: "goudes picture", content_type: "image/webp" }])
place40.save!

rooftop = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688552682/rooftop-r2-terrasses-port_h0kzjf.jpg")
rooftop1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688552682/r2_lcbgyd.jpg")
rooftop2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688552682/5a29182be2465eb40dbee33e849e2558ddcedd62_n7s1t3.jpg")
place41 = Place.new(
  name: "Le R2",
  description: "Le R2 Marseille, lieu emblématique de la vie nocturne, se dresse fièrement sur le Vieux-Port. Cette salle de concert et club offre une ambiance électrisante où la musique, les lumières et la fête se marient. Des artistes internationaux y font vibrer les foules, créant une atmosphère envoûtante et festive. Avec sa vue panoramique sur la mer et sa programmation éclectique, le R2 Marseille est un temple de la musique et de la fête qui promet des soirées inoubliables.",
  longitude: 5.364127,
  latitude: 43.307886,
  price: 10,
  duration: 240,
  secret_spot: false,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: true,
  address: "9 Quai du Lazaret, 13002 Marseille",
  validation: true
)
place41.place_tags << PlaceTag.where(name: ["Vie Nocturne"])
place41.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place41.photos.attach([
  { io: rooftop, filename: "r2 picture", content_type: "image/jpg" },
  { io: rooftop1, filename: "r2 picture", content_type: "image/webp" },
  { io: rooftop2, filename: "r2 picture", content_type: "image/webp" }])
place41.save!

mucem = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688559065/le-mucem-porte-dacces-sur-les-enjeux-et-traditions-de-la-mediterranee-825x460_bd3gcx.jpg")
mucem1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688559065/mucem-jorengootcm-18-1920x960_q4imub.jpg")
mucem2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688559066/Mucem_et_Cath%C3%A9drale_Sainte-Marie-Majeure_de_Marseille_gwbjae.jpg")
place42 = Place.new(
  name: "Le Mucem",
  description: "Le Mucem, musée emblématique de Marseille, se dresse tel un phare culturel entre mer et ville. Sa structure moderne fascine, offrant des expositions captivantes sur l'histoire méditerranéenne. Des collections riches et variées éclairent les visiteurs sur la diversité des cultures qui ont façonné cette région. Les terrasses panoramiques offrent des vues spectaculaires sur le Vieux-Port et la mer. Un lieu où l'art, l'histoire et l'architecture se rencontrent pour célébrer la richesse culturelle de la Méditerranée.",
  longitude: 5.361083,
  latitude: 43.296694,
  price: 11,
  duration: 180,
  secret_spot: false,
  user: user2,
  min_temp: 0,
  max_temp: 30,
  touristic: true,
  address: "Esplanade du J4, 13002 Marseille",
  validation: true
)
place42.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire"])
place42.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place42.photos.attach([
  { io: mucem, filename: "mucem picture", content_type: "image/jpg" },
  { io: mucem1, filename: "mucem  picture", content_type: "image/webp" },
  { io: mucem2, filename: "mucem picture", content_type: "image/webp" }])
place42.save!

museesavon = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688559556/Savonnerie-de-la-licorne-boutique-du-musee-du-savon-marseille-veritable-savon-de-marseille-14_s0s0kb.jpg")
museesavon1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688559555/mus%C3%A9e-du-savon-de-marseille-vieux-port-de-marseille-visite-guidee-9-1_eoslna.jpg")
museesavon2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688559555/boites-histoire-savon-marseille_zur1kc.jpg")
place43 = Place.new(
  name: "Le Musée du Savon",
  description: "Le Musée du Savon de Marseille, niché au cœur de la cité phocéenne, révèle les secrets parfumés de cette icône du patrimoine provençal. À travers des expositions interactives, il plonge les visiteurs dans l'histoire de la fabrication traditionnelle du savon. Les fragrances envoûtantes, les moules d'époque et les savoir-faire ancestraux captivent les sens. Un voyage sensoriel qui révèle l'essence même de la culture marseillaise et de son savoir-faire artisanal unique.",
  longitude: 5.369662,
  latitude: 43.292881,
  price: 3,
  duration: 60,
  secret_spot: true,
  user: user2,
  min_temp: 0,
  max_temp: 30,
  touristic: false,
  address: "25 Quai de Rive Neuve, 13007 Marseille",
  validation: true
)
place43.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire"])
place43.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place43.photos.attach([
  { io: museesavon, filename: "museesavon picture", content_type: "image/jpg" },
  { io: museesavon1, filename: "museesavon  picture", content_type: "image/webp" },
  { io: museesavon2, filename: "museesavon picture", content_type: "image/webp" }])
place43.save!

sugiton = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688561275/randonn%C3%A9e-sugiton-marseille_jejf8y.jpg")
sugiton1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688561275/calanque-en-vau_rcf0oo.jpg")
sugiton2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688561275/750_500_contingentement_sugiton_jane_dziwinski_128_mptw1p.jpg")
place44 = Place.new(
  name: "Calanque de Sugiton",
  description: "La calanque de Sugiton, perle naturelle préservée près de Marseille, enchante par sa beauté sauvage et préservée. Ses eaux cristallines baignent des plages de sable fin, entourées de falaises escarpées. Les sentiers de randonnée offrent des vues panoramiques à couper le souffle, tandis que la végétation méditerranéenne parfume l'air. Un havre de paix où les amoureux de la nature peuvent se ressourcer et se perdre dans un paysage enchanteur, loin de l'agitation urbaine.",
  longitude: 5.455583,
  latitude: 43.210480,
  price: 0,
  duration: 240,
  secret_spot: false,
  user: user2,
  min_temp: 20,
  max_temp: 40,
  touristic: true,
  address: "13009 Marseille",
  validation: true
)
place44.place_tags << PlaceTag.where(name: ["Nature", "Histoire", "Sport"])
place44.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place44.photos.attach([
  { io: sugiton, filename: "sugiton picture", content_type: "image/jpg" },
  { io: sugiton1, filename: "sugiton picture", content_type: "image/webp" },
  { io: sugiton2, filename: "sugiton picture", content_type: "image/webp" }])
place44.save!

puts "place finished"

first_travel = Travel.create(
  name: "Paris",
  user: User.first,
  beginning_date: "2023-06-27",
  ending_date: "2023-06-27",
  starting_point: "1 rue Rivoli, Paris",
  nb_traveler: 2,
  budget: 150,
  local_temperature: 30,
  start_hour: "2023-06-27.10:00:00",
  end_hour: "2023-06-27.20:00:00"
)

second_travel = Travel.create(
  name: "Secret Paris",
  user: User.first,
  beginning_date: "2024-06-15",
  ending_date: "2024-06-27",
  starting_point: "2 rue du Nil, Paris",
  nb_traveler: 5,
  budget: 200,
  local_temperature: 30,
  start_hour: "2023-06-27.10:00:00",
  end_hour: "2023-06-27.20:00:00"
)

puts "travel finished"


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

puts "Travel tagging finished"

# PlaceTagging.create(
#   place: place1,
#   place_tag: PlaceTag.where(name: ["Art et Culture"])
# )

# puts "Place tagging finished"
# place_tags = PlaceTag.where(name: ["Art et Culture", "Escapade Romantique", "Histoire"])
# place_tags.each do |place_tag|
#   place_tagging = PlaceTagging.new(place: place1, place_tag: place_tag)
#   place1.place_taggings << place_tagging
# end

# place1.place_tags << PlaceTag.where(name: ["Art et Culture", "Escapade Romantique", "Histoire"])

# place_tags.each do |place_tag|
#   place1.place_tags << place_tag
# end

arc_step = Step.create(
  travel: first_travel,
  place: place5,
  duration: place5.duration
)
eiffel_tower_step = Step.create(
  travel: first_travel,
  place: place1,
  duration: place1.duration
)
arc_step = Step.create(
  travel: first_travel,
  place: place3,
  duration: place3.duration
)
louvre_step = Step.create(
  travel: first_travel,
  place: place2,
  duration: place2.duration
)

cremieux_step = Step.create(
  travel: Travel.last,
  place: place11,
  duration: place11.duration
)
square_step = Step.create(
  travel: Travel.last,
  place: place13,
  duration: place13.duration
)
butte_step = Step.create(
  travel: Travel.last,
  place: place14,
  duration: place14.duration
)
parc_step = Step.create(
  travel: Travel.last,
  place: place12,
  duration: place12.duration
)
puts "step finished"
