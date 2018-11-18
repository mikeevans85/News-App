# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Source.create(name: "New York Times", api_url: "nytimes.com", source_language: "en", place_of_pub: "United States", description: "The New York Times is an American newspaper based in New York City with worldwide influence and readership.", image_url: "https://texasperformingarts.org/sites/files/tpa/tpa_news_images/new-york-times-logo.jpg")
Source.create(name: "Der Spiegel", api_url: "derspiegel.com", source_language: "de", place_of_pub: "Germany", description: "Deutschlands führende Nachrichtenseite. Alles Wichtige aus Politik, Wirtschaft, Sport, Kultur, Wissenschaft, Technik und mehr.", image_url: "https://pbs.twimg.com/profile_images/485675179578621952/bKZ2uPHZ_400x400.png")
Source.create(name: "China Daily", api_url: "chinadaily.cn", source_language: "zh-cn", place_of_pub: "China", description: "China Daily is an English-language daily newspaper published in the People's Republic of China.", image_url: "https://scontent-ort2-1.xx.fbcdn.net/v/t1.0-1/p200x200/11904710_10153464248266291_762654926883567611_n.png?_nc_cat=1&_nc_ht=scontent-ort2-1.xx&oh=665323b0775fa085a8ea96ef5848fe85&oe=5C6E8DD5")