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
)
# place_tags = PlaceTag.where(name: ["Art et Culture", "Escapade Romantique", "Histoire"])
# place_tags.each do |place_tag|
#   place_tagging = PlaceTagging.new(place: place1, place_tag: place_tag)
#   place1.place_taggings << place_tagging
# end

place1.place_tags << PlaceTag.where(name: ["Art et Culture", "Escapade Romantique", "Histoire"])
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
)
place2.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire"])
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
  address: "Pl. Charles de Gaulle, 75008 Paris"
)
place3.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire"])
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
  address: "Rue de Vaugirard, 75006 Paris"
)
place5.place_tags << PlaceTag.where(name: ["Nature", "Escapade Romantique",])
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
  address: "Place d'Armes, 78000 Versailles"
)
place6.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire", "Spectacle"])
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
  address: "35 Chevalier de La Barre, 75018 Paris"
)
place7.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire", "Escapade Romantique"])
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
  address: "Avenue Winston-Churchill, 75008 Paris"
)
place8.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire", "Escapade Romantique"])
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
  address: "6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris"
)
place9.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire"])
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
  address: "Pl. de l'Opéra, 75009 Paris"
)
place10.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire", "Spectacle", "Escapade Romantique"])
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
  address: "Avenue Junot, 75018 Paris",
)
place15.place_tags << PlaceTag.where(name: ["Art et Culture", "Histoire"])
place15.photos.attach([
  { io: villa, filename: "villa picture", content_type: "image/jpg" },
  { io: villa1, filename: "villa picture", content_type: "image/webp" },
  { io: villa2, filename: "villa picture", content_type: "image/webp" }])
place15.save!

# njerfreof

lacdaumesnil = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688551282/embarcadere1_gwtlw7.webp")
lacdaumesnil1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688551334/grotte1_pgpmwg.webp")
lacdaumesnil2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688551338/rocher-du-zoo1_m2q5mc.webp")
place16 = Place.new(
  name: "Les Barques du Lac Daumesnil",
  description: " Les Barques du Lac Daumesnil vous proposent de venir canoter en barque sur les douze hectares du charmant lac Daumesnil.",
  longitude: 2.410029,
  latitude: 48.832986,
  price: 15,
  duration: 45,
  secret_spot: true,
  user: user2,
  min_temp: 18,
  max_temp: 30,
  touristic: false,
  address: "Route de Ceinture du Lac Daumesnil, 75012 Paris",
)
place16.place_tags << PlaceTag.where(name: ["Aventure", "Sport", "Nature", "Escapade Romantique"])
place16.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])
place16.photos.attach([
  { io: lacdaumesnil, filename: "barque lac daumesnil picture", content_type: "image/webp" },
  { io: lacdaumesnil1, filename: "barque lac daumesnil picture", content_type: "image/webp" },
  { io: lacdaumesnil2, filename: "barque lac daumesnil picture", content_type: "image/webp" }])
place16.save!

evasionverte = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688552048/Photo-Accro_rxxhmf.png")
evasionverte1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688552082/ADO-accrobranche-explora-parc-02_kozao2.jpg")
evasionverte2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688552047/ADULTE-accrobranche-explora-parc-02_ucth18.jpg")

place17 = Place.new(
  name: "Accrobranche au Parc floral de Paris",
  description: "Le parc d'accrobranche EVASION VERTE situé au coeur du Parc Floral de Paris vous propose une experience unique: tyroliennes, ponts de cordes, plates-formes pour adultes et grands enfants.",
  longitude: 2.435581,
  latitude: 48.840639,
  price: 22,
  duration: 120,
  secret_spot: true,
  user: user2,
  min_temp: 15,
  max_temp: 25,
  touristic: false,
  address: "Parc floral de Paris, Esplanade du château de Vincennes, 75012 Vincennes",
)
place17.place_tags << PlaceTag.where(name: ["Aventure", "Sport", "Nature"])
place17.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place17.photos.attach([
  { io: evasionverte, filename: "accrobranche picture", content_type: "image/png" },
  { io: evasionverte1, filename: "accrobranche picture", content_type: "image/jpg" },
  { io: evasionverte2, filename: "accrobranche picture", content_type: "image/jpg" }])
place17.save!

vallée_village = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688552867/2023-06-19_xyvqv5.jpg")
vallée_village1= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688552868/2023-03-21_slmmo2.jpg")
vallée_village2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688552896/2022-10-03_ebfelw.jpg")
place18 = Place.new(
  name: "La Vallée Village",
  description: "La vallée village est centre commercial en plein air avec plus de 110 magasins d'usine d'enseignes de luxe et de première qualité",
  longitude: 2.783114,
  latitude: 48.853850,
  price: 0,
  duration: 240,
  secret_spot: true,
  user: user2,
  min_temp: 10,
  max_temp: 35,
  touristic: false,
  address: "3 Cours de la Garonne, 77700 Serris",
)
place18.place_tags << PlaceTag.where(name: ["Shopping"])
place18.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place18.photos.attach([
  { io: vallée_village, filename: "la vallée village picture", content_type: "image/jpg" },
  { io: vallée_village1, filename: "la vallée village picture", content_type: "image/jpg" },
  { io: vallée_village1, filename: "la vallée village picture", content_type: "image/jpg" }])
place18.save!

champs_elysees = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688554724/avenue-champs-elysees-paris-france_rk8pdk.jpg")
champs_elysees1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688554724/960x614_visuel-des-nouvelles-illuminations-des-champs-elysees-realise-par-blachere-illumination-et-le-comite-champs-elysees_dvaamq.jpg")
champs_elysees2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688554735/USI367XIMFFB3B6SAF6A7ZJBOQ_botygs.jpg")

place19 = Place.new(
  name: "Les Champs Elysées",
  description: "L’avenue des Champs-Élysées, reconnue pour être la plus belle avenue du monde, est un lieu de shopping incontournale à Paris",
  longitude: 2.297853,
  latitude: 48.872960,
  price: 0,
  duration: 240,
  secret_spot: true,
  user: user2,
  min_temp: 0,
  max_temp: 35,
  touristic: true,
  address: "Avenue des Champs-Élysées, 75008 Paris")

place19.place_tags << PlaceTag.where(name: ["Shopping", "Escapade Romantique"])
place19.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place19.photos.attach([
  { io: champs_elysees, filename: "champs élysées picture", content_type: "image/jpg" },
  { io: champs_elysees1, filename: "champs élysées picture", content_type: "image/jpg" },
  { io: champs_elysees2, filename: "champs élysées picture", content_type: "image/jpg" }])
place19.save!

francs_bourgeois= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688559264/musee-carnavalet-jardin-paris-zigzag-e1550070641172.png_rvxgz3.webp")
francs_bourgeois1= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688559265/rue-beaute-francs-bourgeois-paris-zigzag-e1550069668904.png_y35vne.webp")
francs_bourgeois2= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688559266/La-rue-des-Francs-Bourgeois_zeihrj.jpg")

place20 = Place.new(
  name: "Rue des Francs bourgeois",
  description: "La rue des Francs-bourgeois propose un agréable mélange de magasins de mode, de boutiques élégantes et de design pour la maison, accompagné d'une sélection remarquable de restaurants et d'endroits culturels incontournables, tels que le Musée Carnavalet.",
  longitude: 2.360405,
  latitude: 48.857845,
  price: 0,
  duration: 240,
  secret_spot: true,
  user: user2,
  min_temp: 0,
  max_temp: 35,
  touristic: false,
  address: "Rue des Francs bourgeois, 75004 Paris")

place20.place_tags << PlaceTag.where(name: ["Shopping", "Escapade Romantique", "Histoire", "Art et Culture"])
place20.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place20.photos.attach([
  { io: francs_bourgeois, filename: "rue des francs bourgeois picture", content_type: "image/webp" },
  { io: francs_bourgeois1, filename: "rue des francs bourgeois picture", content_type: "image/webp" },
  { io: francs_bourgeois2, filename: "rue des francs bourgeois picture", content_type: "image/jpg" }])
place20.save!


lido= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688560460/536962-lido-une-semaine-anniversaire-pour-les-5-ans-de-paris-merveilles_tgskv0.jpg")
lido1= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688560460/73_lrlubl.jpg")
lido2= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688560460/76_dabse1.jpg")

place21 = Place.new(
  name: "Le Lido",
  description: "Le Lido est un somptueux cabaret crée en 1946 et reconnu dans le monde entier! Vous y découvrirez chorégraphies, performances burlesques, acrobatiques, gymnastiques ainsi que des costumes exotiques ornés de paillettes, de plumes et de strass.",
  longitude: 2.300838,
  latitude: 48.872392,
  price: 50,
  duration:120 ,
  secret_spot: true,
  user: user2,
  min_temp:0,
  max_temp: 40,
  touristic: true,
  address: "116 bis avenue des Champs Elysées, 75008 Paris")

place21.place_tags << PlaceTag.where(name: ["Spectacle", "Vie Nocturne"])
place21.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "Entre Amis"])

place21.photos.attach([
  { io: lido, filename: "lido picture", content_type: "image/jpg" },
  { io: lido1, filename: "lido picture", content_type: "image/jpg" },
  { io: lido2, filename: "lido picture", content_type: "image/jpg" }])
place21.save!


moulin_rouge= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688560759/moulin-rouge_r8vk4r.jpg")
moulin_rouge1= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688560759/0a_grraju.jpg")
moulin_rouge2= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688560759/80_iiqvi1.jpg")

place22 = Place.new(
  name: "Le Moulin Rouge",
  description: "Plongez-vous dans l'extravagance du Moulin Rouge, le spectacle le plus populaire à Paris! Admirez les talentueuses troupes de danseuses et danseurs hauts en couleur se pavaner dans leurs froufrous sur la scène historique du Moulin Rouge.
  Laissez-vous emporter dans la danse et le théâtre et titillez vos papilles de saveurs gastronomiques françaises au cours d'un délicieux repas.",
  longitude: 2.332581,
  latitude: 48.884030 ,
  price: 110,
  duration: 240,
  secret_spot: true,
  user: user2,
  min_temp: 0 ,
  max_temp: 35 ,
  touristic: true,
  address: "82 Bd de Clichy, 75018 Paris")

place22.place_tags << PlaceTag.where(name: ["Vie Nocturne", "Spectacle"])
place22.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "Entre Amis"])

place22.photos.attach([
  { io: moulin_rouge, filename: "moulin rouge picture", content_type: "image/jpg" },
  { io: moulin_rouge1, filename: "moulin rouge picture", content_type: "image/jpg" },
  { io: moulin_rouge2, filename: "moulin rouge picture", content_type: "image/jpg" }])
place22.save!

spa_biere= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688561743/IN9A8732_re-69da77c9-1920w_hdpgn4.webp")
spa_biere1= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688561742/IN9A8739_re-01d52a22-1920w_sxxue9.webp")
spa_biere2= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688561742/IN9A8730_re-1920w_g9ckjk.webp")

place23 = Place.new(
  name: "Spa à la bière",
  description: "Plongez dans un bain à remous en chêne sculpté, rempli des principaux ingrédients de la  bière  (Houblon , Malt et Levure de Bière).
  Une dégustation de bières (avec ou sans alcool) vous sera offerte pendant votre bain.
  Vous pourrez également tester des produits cosmétiques à base de bières.
  Vous goûterez de la gelée de bière et des biscuits à la bière.",
  longitude: 2.321067,
  latitude: 48.848509,
  price: 70,
  duration: 60,
  secret_spot: true,
  user: user2,
  min_temp: 0,
  max_temp: 35,
  touristic: false,
  address: "101 Rue de Sevre, 75006 PARIS")

place23.place_tags << PlaceTag.where(name: ["Détente et Spa"])
place23.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "Entre Amis"])

place23.photos.attach([
  { io: spa_biere , filename: "spa à la bière picture", content_type: "image/webp" },
  { io: spa_biere1, filename: "spa à la bière picture", content_type: "image/webp"},
  { io: spa_biere2, filename: "spa à la bière picture", content_type: "image/webp" }])
place23.save!

suisen= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688569006/Unknown-2_vhnrlx.jpg")
suisen1= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688569006/Unknown_r2onip.jpg")
suisen2= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688569006/Unknown-1_n6uzh2.jpg")

place24 = Place.new(
  name: "Suisen, Spa Japonais",
  description: "Envie de découvrir tous les bienfaits du spa japonais ? On se rend chez Suisen Spa dans le 3e arrondissement pour découvrir toutes les prestations de l'établissement. Wa, Jaku, Sei, Kei...
  A vous les moments de détente et d'harmonisation de vos énergies vitales à travers différentes techniques de Shiatsu.",
  longitude:2.362882 ,
  latitude:48.859922,
  price: 70,
  duration: 60,
  secret_spot: true,
  user: user2,
  min_temp: 0,
  max_temp: 35,
  touristic: false,
  address: "7 Rue de Thorigny, 75003 Paris")
place24.place_tags << PlaceTag.where(name: ["Détente et Spa"])
place24.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "Entre Amis"])

place24.photos.attach([
  { io: suisen, filename: "suisen spa photo", content_type: "image/jpg" },
  { io: suisen1, filename: "suisen spa photo", content_type: "image/jpg" },
  { io: suisen2 , filename: "suisen spa photo", content_type: "image/jpg" }])
place24.save!

galerie_gourmets= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688566809/2023-03-17_fzmawa.jpg")
galerie_gourmets1= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688566808/2023-05-23_mryfcp.jpg")
galerie_gourmets2= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688566808/2023-02-18_fd9hak.jpg")

place25 = Place.new(
  name: "Galerie Lafayette Le Gourmet",
  description: "Un lieu parfait pour découvrir toutes les spécialités françaises: Pains, pâtisseries, plats de traiteur et desserts de chefs français renomés",
  longitude: 2.330405 ,
  latitude: 48.873154,
  price: 20,
  duration: 90,
  secret_spot: true,
  user: user2,
  min_temp: 0,
  max_temp: 35 ,
  touristic: true,
  address: "35 Boulevard Haussmann, 75009 Paris")

place25.place_tags << PlaceTag.where(name: ["Nourriture"])
place25.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place25.photos.attach([
  { io: galerie_gourmets, filename: "Galerie Lafayette Le Gourmet picture ", content_type: "image/jpg" },
  { io: galerie_gourmets1, filename: "Galerie Lafayette Le Gourmet picture", content_type: "image/jpg" },
  { io: galerie_gourmets2, filename: "Galerie Lafayette Le Gourmet picture", content_type: "image/jpg" }])
place25.save!

grolet= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688567338/Cedric-Grolet-le-meilleur-patissier-du-monde.jpg_lonqyl.webp")
grolet1= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688567338/1652702474394_b438ba12-1c2b-42db-a5c5-c3cd0d372fc5_z0a8ia.webp")
grolet2= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688567338/1652702807680_3095bd65-5237-4169-93f4-c534e73ca410_adq85n.webp")

place26 = Place.new(
  name: "La Pâtisserie du Meurice par Cédric Grolet",
  description: "Le prestigieux palace Le Meurice vous invite à savourer les célèbres pâtisseries du renommé chef Cédric Grolet, dont ses incroyables créations en trompe-l'œil.",
  longitude: 2.327985,
  latitude: 48.865724,
  price: 20,
  duration: 60,
  secret_spot: true,
  user: user2,
  min_temp: 0,
  max_temp: 35,
  touristic: true,
  address: "6 Rue de Castiglione, 75001 Paris")
place26.place_tags << PlaceTag.where(name: ["Nourriture"])
place26.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place26.photos.attach([
  { io: grolet, filename: "La Pâtisserie du Meurice par Cédric Grolet picture", content_type: "image/webp" },
  { io: grolet1, filename: "La Pâtisserie du Meurice par Cédric Grolet picture", content_type: "image/webp" },
  { io: grolet2, filename: "La Pâtisserie du Meurice par Cédric Grolet picture", content_type: "image/webp" }])
place26.save!

disney= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688567895/ff849442dbc4bd0759909deffc05cc95-254-paris-01-paris-_-disneyland-02_a1r2sl.jpg")
disney1= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688567895/Unknown_j43ews.jpg")
disney2= URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688567894/Unknown-1_bzac8l.jpg")

place27 = Place.new(
  name: "Disneyland Paris",
  description: "Découvrez la magie ultime à Disneyland, un lieu où les rêves deviennent réalité!
  Plongez dans un univers enchanté rempli d'attractions palpitantes, de spectacles éblouissants et de rencontres avec vos personnages Disney préférés.
  Des parades féériques aux délicieuses collations, chaque instant est empreint de joie et de merveille.",
  longitude:2.776623,
  latitude:48.871900,
  price: 100,
  duration: 480,
  secret_spot: true,
  user: user2,
  min_temp: 5,
  max_temp: 30,
  touristic: true,
  address: "77777, Chessy")
place27.place_tags << PlaceTag.where(name: ["Parc d'attraction"])
place27.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place27.photos.attach([
  { io: disney, filename: "Disneyland Paris picture", content_type: "image/jpg" },
  { io: disney1, filename: "Disneyland Paris picture", content_type: "image/jpg" },
  { io: disney2, filename: "Disneyland Paris picture", content_type: "image/jpg" }])
place27.save!


jardin_acclimatation = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688568062/75040d36-967f-4a7d-a399-cba65ce07bae_chaises_volantes__8_qmzexc.webp")
jardin_acclimatation1 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688568062/ca1acc50-27fc-4b5a-a57d-9612130a457d_che_CC_80vre_ferme_ylrzvh.webp")
jardin_acclimatation2 = URI.open("https://res.cloudinary.com/dwl5s1v4k/image/upload/v1688568062/2b3bef1f-c28a-49f0-8769-840f78e13244_Atelier_-_2_cvayod.webp")

place28 = Place.new(
  name: "Le jardin d'acclimatation",
  description: "le jardin d'acclimatation est un parc d'attractions très apprécié des parisiens, adultes comme enfants, pour ses  manèges, aires de jeux, promenades à cheval, ateliers et événements.",
  longitude: 2.249173,
  latitude: 48.862440,
  price: 46,
  duration: 240 ,
  secret_spot: true,
  user: user2,
  min_temp: 15,
  max_temp: 35,
  touristic: false,
  address: "Bois de Boulogne, Route de la Porte Dauphine à la Porte des Sablons, 75116 Paris")

place28.place_tags << PlaceTag.where(name: ["Parc d'attraction"])
place28.place_traveler_type_tags << PlaceTravelerTypeTags.where(tag: ["Seul", "En Couple", "En Famille", "Entre Amis"])

place28.photos.attach([
  { io: jardin_acclimatation, filename: "Le jardin d'acclimatation picture", content_type: "image/webp" },
  { io: jardin_acclimatation1, filename: "Le jardin d'acclimatation picture", content_type: "image/webp" },
  { io: jardin_acclimatation2, filename: "Le jardin d'acclimatation picture", content_type: "image/webp" }])
place28.save!

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
