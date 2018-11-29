# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'nokogiri'
require 'open-uri'

    doc = Nokogiri::HTML(open("https://wall.alphacoders.com/search.php?lang=French&search=chat"))
    @taburl = []
    @tabtitle = ["chat dorée","chat chat","un petit chat trés mignion","chat gris","chat de la vega","chat petit","chat saute","chat de se chat"]
    myhash = {}
    20.times do
        doc.css('.boxgrid img @src').each do |url| @taburl << url.text end
    end

    8.times do |y|
        @items = Item.create(title:@tabtitle[y], description:Faker::Lorem.paragraph, price:rand(1.00...10), image_url:@taburl[y])
    end
