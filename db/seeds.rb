# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Source.create(name: "New York Times", api_url: "nytimes.com", source_language: "en")
Source.create(name: "Der Spiegel", api_url: "derspiegel.com", source_language: "de")
Source.create(name: "China Daily", api_url: "chinadaily.cn", source_language: "zh-cn")
