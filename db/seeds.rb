# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Activity.destroy_all
#Choices
Choice.destroy_all
#Suggestions
Suggestion.destroy_all
#Surveys
Survey.destroy_all
#User_events
UserEvent.destroy_all
#Events
Event.destroy_all
#Users (Les Users doivent être détruits en dernier,
#car un Event ne peut exister sans User)
User.destroy_all

puts 'Creating users...'

users_attributes =
[{
first_name: "Sophie",
last_name: "Fonfec",
email: "sophie@gmail.com",
password: "8Lalasoso"
}]

User.create!(users_attributes)

puts 'Users created !'

puts 'Creating events...'

events_attributes =
[{
  name: "EVJF de Bernadette",
  event_category: "EVJF",
  token: "12345",
  user_id: User.last[:id]
},
{
  name: "EVG de Jean-Mimi",
  event_category: "EVG",
  token: "123456",
  user_id: User.last[:id],
  destination: "Lille"
},
{
name: "EVG de Nico",
event_category: "EVG",
token: "6789",
user_id: User.last[:id]
}]

Event.create!(events_attributes)

puts 'Events created !'

puts 'Creating surveys...'

surveys_attributes =
[{
  name: "EVG de Nico",
  event_id: Event.last[:id]
}]
Survey.create!(surveys_attributes)
puts 'Surveys created !'

puts 'Creating suggestions...'

suggestions_attributes =
[{
  topic: "Destination",
  value: "Prague",
  survey_id: Survey.first[:id]
},
{
  topic: "Destination",
  value: "Marseille",
  survey_id: Survey.first[:id]
},
{
  topic: "Destination",
  value: "Lille",
  survey_id: Survey.first[:id]
},
{
  topic: "Dates",
  start_date: Date.parse("Oct 23 2019"),
  end_date: Date.parse("Oct 25 2019"),
  survey_id: Survey.first[:id]
},
{
  topic: "Dates",
  start_date: Date.parse("Nov 12 2019"),
  end_date: Date.parse("Nov 14 2019"),
  survey_id: Survey.first[:id]
},
{
  topic: "Dates",
  start_date: Date.parse("Dec 8 2019"),
  end_date: Date.parse("Dec 10 2019"),
  survey_id: Survey.first[:id]
}]

Suggestion.create!(suggestions_attributes)
puts 'Suggestions created !'

puts 'Creating activities...'
activities_attributes = [
  {
  title: "Ski Nautique",
  description: "Faire du ski nautique à 30 de Paris vous en rêviez ? Et bien, cela devient possible grâce à notre centre !
Venez découvrir deux offres de ski : le ski classique, avec son stade de slalom et perfect pass et le ski de figure.
Découvrez également les plaisirs du bi-skis : initiation ludique vous permettant d'accéder rapidement au mono-ski et au ski de figure.
Alors qu'attendez-vous ?
En premier lieu, des conseils pédagogiques vous seront donnés afin d'assurer votre sécurité.
Une fois la combinaison mise, vous pouvez vivre votre activité à fond et découvrir le ski nautique !",
  unit_price: 50,
  category: "sports nautiques",
  schedule: "Du lundi au vendredi : 12h à 20h. Attention, centre fermé le mardi. Le week-end : 10h - 20h30.",
  min_number_of_participants: 1,
  max_number_of_participants: 4,
  min_age: 16,
  duration: 20,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566450821/di1xrktli5uruhznfl7l.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566450827/aeefv1ej0siup8behzoz.jpg",
  address: "15 Boulevard Charles Livon, 13007 Marseille",
  },

    {
  title: "Location de jet ski",
  description: "La plus grande base nautique de Vendée, et la SEULE BASE SABLAISE de location de JET SKI, vous accueille pour vous faire découvrir les joies de la glisse. Une expérience unique, des émotions fortes, des souvenirs inoubliables, un 'cocktail' idéal pour repartir avec des souvenirs plein la tête. Faites vous plaisir ! Dès 16 ans, pilotez seul votre jet ski ! Naviguez en toute sécurité. Pour ceux qui connaissent pas encore : l'expérience est unique ! Pour ceux qui connaissent déjà : plus rien à dire ! ils sont convaincus. Accompagné d'un éducateur sportif diplômé d'Etat et passionné, vous naviguerez au gré des vagues de la côté Vendéenne. Sur un jet ski (ou scooter des mers), vous irez à toute allure sur les eaux turquoises de l'Atlantique. Même sans permis bateau, c'est vous qui piloterez votre jet ski, et pourrez même avoir un passager arrière, tant que celui fait au minimum 1m40. Vous aurez le choix de plusieurs jet ski, tous de la marque Yamaha. Possibilité de naviguer seul à partir de 16 ans si vous détenez un permis bateau.",
  unit_price: 75,
  category: "sports nautiques",
  schedule: "Du 1e avril au 30 septembre (7/7j)",
  min_number_of_participants: 1,
  max_number_of_participants: 2,
  min_age: 18,
  duration: 45,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566450598/f00mwt26scwrle8z1pld.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566451161/gjbkqnojbpg1vwgbuzez.jpg",
  address: "402 chemin du Roucas Blanc, Marseille",
  },

  {
  title: "Rafting",
  description: "Le raft est une embarcation constituée de plusieurs caissons gonflable extrêmement solide assurant l'insubmersibilité du bateau. Un guide diplômé d'Etat expliquant toutes les manœuvres et consignes aux occupants avant le départ pour le plaisir. C'est une activité accessible à tous, notre parcours se situe en Haute Savoie et permet de naviguer en toute sécurité sur nos torrents alpins, pour le plaisir des yeux, pour le goût de l’effort partagé ou pour la découverte des paysages sauvages et des histoires de nos vallées (métiers d'antan, castors, pont Eiffel...).",
  unit_price: 40,
  category: "sports nautiques",
  schedule: "Lundi, Mardi, Mercredi, Jeudi, Vendredi, Samedi",
  min_number_of_participants: 4,
  max_number_of_participants: 8,
  min_age: 8,
  duration: 120,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566450800/t6q4ibpu57cyfwbmk2sd.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566450791/cibgdfpcnqhwdx487oni.jpg",
  address: "30 Cours Honoré d'Estienne d'Orves, 13001 Marseille",
  },

    {
  title: "Laser Game Xmax",
  description: "LE PREMIER Laser Game DU 92 ! Un labyrinthe de 480 m2 sur 3 niveaux où vous serez au coeur du jeu ! Le Laser Game vous propose aussi un bar lounge, une salle de jeux (avec baby-foot, palets, basket,…) et une salle « after game ». En équipe, en solo, découvrez toutes nos formules de jeu, pour les plus jeunes fantassins comme pour les plus aguerris des vétérans. Un seul mot d’ordre : plaisir, adrénaline, stratégie, adresse, coopération, … bon ok, ça fait un peu plus d’un mot …",
  unit_price: 12,
  category: "ludique",
  schedule: "ouvert du lundi au dimanche sur réservation",
  min_number_of_participants: 4,
  max_number_of_participants: 40,
  min_age: 8,
  duration: 20,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566450732/vplp1tvkrzfbgwyho3xe.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566450739/zlqyf7awp58e6tqptphq.jpg",
  address: "47 Avenue de l'Europe, 92400 Courbevoie",
  },

      {
  title: "Jeu de piste connecté",
  description: "Voici une activité atypique à la croisé entre un escape game et un jeu de piste connecté !
Constituez votre équipe de 2 à 6 joueurs puis tentez de réussir le plus de challenges et de résoudre le maximum d'énigmes dans Bordeaux.
Vous aurez 60 minutes pour récolter le plus de points possible. Que la meilleure équipe gagne !
Pourquoi choisir cette activité ?
Un challenge inédit
Une visite de la ville autrement
Une activité parfaite pour les team building et les grand groupes",
  unit_price: 16,
  category: "ludique",
  schedule: "Ouvert le Samedi de de 12h à 18h",
  min_number_of_participants: 2,
  max_number_of_participants: 6,
  min_age: 12,
  duration: 90,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566450704/mx4nvu153sa17feh4tsv.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566451143/ymc9hcoprjix5gvztonf.jpg",
  address: "2 rue du Chemin Vert, 75011 Paris",
  },

      {
  title: "Stage de pilotage",
  description: "Grande championne à 5 reprises des 24 Heures du Mans, l'Audi R8 avec son design unique est considéré comme le haut de gamme d'Audi.
Des lignes à en faire saliver plus d'un, un bruit unique grâce à son moteur V8 FSI et 420 chevaux. La marque allemande, historiquement réputée pour sa discrétion a cassé tous les codes pour créer ce bijou technologique.
Un volant en cuir à base plate (à tenir fermement) : L'Audi R8 peut atteindre les 100 km/h en 4,6 secondes !
Prêt à dompter l'aboutissement d'une marque ?",
  unit_price: 149,
  category: "mécanique",
  schedule: "Ouvert le Samedi de de 9h à 18h",
  min_number_of_participants: 1,
  max_number_of_participants: 1,
  min_age: 18,
  duration: 25,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566450753/jr5rxd3hjxgxmugzwzbv.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566450760/yvfgmzn8ogt4kugkvjxs.jpg",
  address: "28 Avenue des Frères Lumière, 78190 Trappes",
  },

      {
  title: "Randonnée en quad",
  description: "Si vous êtes à a recherche de loisirs en nature, locations et randonnées en quad à Deauville sont ce qu'il vous faut ! Des sensations fortes et de l'adrénaline vous attendent lors de cette balade en plein air !
Rejoignez-nous en plein cœur de la forêt de Deauville sur un domaine de 16 hectares au volant d'un de nos 5 quatre-roues tout terrain monoplace équipés de moteurs 700cm3. Le parcours est composé d'obstacles tels les dévers, bourbiers ou autres champs d’ornières. Un parcours magnifique à tester sur ces engins motorisés, en toute sécurité !
Vous avez aussi la possibilité de vous offrir une balade en quad dans un autre endroit, dans le cadre d'un de nos programmes itinérants.",
  unit_price: 43,
  category: "mécanique",
  schedule: "Sur réservation",
  min_number_of_participants: 1,
  max_number_of_participants: 8,
  min_age: 16,
  duration: 45,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566450781/ouzdziimj6lujcijaxyv.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566450775/v3dzo9jfdptmfbk8qyce.jpg",
  address: "3 Avenue Pierre Brossolette, Saint-Maur-des-Fossés",
  },

        {
  title: "Massage californien",
  description:"• Réalisé sur l'ensemble du corps
• Produits utilisés : Huile de noisette
• Manœuvres douces et lentes d'effleurages enveloppants et de lissages fluides
• Bienfaits : Sentiment de bien-être intense | Harmonie du corps et de l’esprit",
  unit_price: 80,
  category: "bien-être",
  schedule: "du mardi au dimanche, 11h à 17h" ,
  min_number_of_participants: 1,
  max_number_of_participants: 2,
  min_age: 18,
  duration: 75,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559173/GettyImages-Woman-Massage-NKS_Imagery_krk3fk.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559176/massage_centers_in_sharjah_xuaqs4.jpg",
  address: "156 Rue Oberkampf 75011 Paris",
  },

          {
  title: "Relooking vestimentaire",
  description: "Cours d'auto-coiffage
• Apprentissage ludique des techniques et gestes de coiffage
• Conseils sur les produits et outils à utiliser selon votre profil
Accompagnement shopping
• Une session shopping sur mesure
• Conseils sur les vêtements à privilégier pour mettre en valeur votre silhouette
• Les boutiques sont choisies en fonction de votre budget
• Conseils pour optimiser votre garde-robe en fonction de votre personnalité et de votre style de vie",
  unit_price: 130,
  category: "bien-être",
  schedule: "Sur rendez-vous",
  min_number_of_participants: 1,
  max_number_of_participants: 1,
  min_age: 16,
  duration: 120,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559257/relooking-complet-femme-annecy-74_ctiumx.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559277/woman-clothes-shopping_gmnno7.jpg",
  address: "106 Rue de Turenne 75003 Paris",
  },

          {
  title: "Défi œnologique",
  description: "Participez à un atelier œnologique où les gages sont au rendez-vous. Vous pourrez alors faire des jeux d'équipe, découvrir la ville de Paris, apprendre les étapes de la dégustation et déguster et faire des quizz.",
  unit_price: 60,
  category: "fin gourmet",
  schedule: "Sur rendez-vous",
  min_number_of_participants: 4,
  max_number_of_participants: 10,
  min_age: 10,
  duration: 90,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559194/degustation-de-vin-francais_lrfxox.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559199/degustation-de-vin-dans_t89vs6.jpg",
  address: "16 rue Wagram, 75016 Paris",
  },

          {
  title: "Initiation à l'horlogerie",
  description: "Glissez-vous dans le peau d'un horloger le temps de quelques heures en famille, entre amis ou en solo.
Ce centre vous propose une véritable initiation horlogère avec plusieurs étapes : démontage, nettoyage, remontage, lubrification, réglage d’un mouvement mécanique suisse ETA et son contrôle via un chrono-comparateur.
Ces ateliers d'initiation à l'horlogerie sont dispensés à Paris mais aussi en Province et à l'étranger.
Cette activité est idéale pour une sortie en famille ou entre amis. ",
  unit_price: 120,
  category: "loisirs créatifs",
  schedule: "Sur rendez-vous",
  min_number_of_participants: 2,
  max_number_of_participants: 6,
  min_age: 16,
  duration: 120,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559568/Operateur_en_horlogerie_Header_01_h5ok1w.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559556/242f56a4b4_117964_mecanisme-horlogerie-suisse_gyfqvv.jpg",
  address: "32 rue mouffetard, 75005 Paris",
  },

            {
  title: "Dégustation de bières",
  description: "Oubliez les bières de grande distribution et venez tenter l'aventure des bières artisanales avec cet atelier !
Cet atelier s’adresse aux amateurs, aux curieux mais aussi à celles et ceux qui pensent ne pas aimer la bière. Au cours de la séance de dégustation de bière, vous découvrirez cinq bières artisanales, répondant à différents styles (stout, blanche, saison…) et différentes cultures (Angleterre, Belgique, USA…), confectionnées avec amour et talent par des brasseurs français.
Vous en apprendrez plus sur le brassage et les éléments qui composent la bière : Le malt – Le houblon – La levure.
Venez redécouvrir la bière grâce à cet atelier de découverte de bières artisanales.",
  unit_price: 40,
  category: "fin gourmet",
  schedule: "Tous jours, de 18h à 22h",
  min_number_of_participants: 4,
  max_number_of_participants: 10,
  min_age: 18,
  duration: 60,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559227/barcelone_degustation_bieres_artisanales_bjk5gb.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559234/image_whjk89.jpg",
  address: "27 Rue des Jacobins, Clermont-Ferrand",
  },

            {
  title: "Simulateur chute libre",
  description: "La chute libre en soufflerie est probablement l’une des activités les plus originales que vous pouvez trouver en France. C'est un concept unique au monde, conçu et réalisé par des ingénieurs français.
Accessible dès 8 ans, peu importe votre niveau (pas besoin d’être un « grand sportif ») vous pouvez effectuer cette activité en toute sécurité. Des sensations fortes immédiates !",
  unit_price: 50,
  category: "sports sensations",
  schedule: "Du mercredi au vendredi de 17h à 00h Le Samedi de 14h à 00h Le Dimanche de 14h à 19h",
  min_number_of_participants: 1,
  max_number_of_participants: 4,
  min_age: 8,
  duration: 15,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559707/chute-libre-simulateur-madrid-e1494242916369_jr2qcp.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559724/chute-libre-indoor-ifly-lyon-fly1_jjfu1b.jpg",
  address: "72 Rue Lecocq, Bordeaux",
  },

            {
  title: "Atelier cocktails",
  description: "Découvrez ce bar à cocktails à l'ambiance années folles implanté à deux pas de République !
Ici on vous propose des ateliers de mixologie qui conviendront aussi bien aux entreprises qu'aux particuliers.
Vous deviendrez donc, pendant 1h30, un véritable barman.
Après une description des ingrédients, des spiritueux, des décorations, du matériel et une démonstration par le barman, les participants réalisent trois cocktails selon leurs goûts et envies, avant de les déguster, accompagnés de petits assortiments salés. ",
  unit_price: 60,
  category: "fin gourmet",
  schedule: "Du mardi au samedi de 17h à 0h" ,
  min_number_of_participants: 1,
  max_number_of_participants: 8,
  min_age: 18,
  duration: 90,
  remote_main_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559149/80274_w1024h768c1cx2378cy1278cxt0cyt0cxb4799cyb3199_piavco.jpg",
  remote_second_photo_url: "https://res.cloudinary.com/dvc6dt55q/image/upload/v1566559150/SatsumaFeature_h86hsn.jpg",
  address: "54 Rue Gustave Delory, Lille",
  },
]
Activity.create!(activities_attributes)



puts 'Finished !'
