# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'
require 'open-uri'
require 'pp'
doc = Nokogiri::HTML(open('http://www.indianfoodforever.com/'))
results = doc.css('div.top-link a').map do |cname|
  #Category.create([name: cname.content])
  recipe = cname.attribute('href').to_s
  doc1 = Nokogiri::HTML(open(recipe))
  results1 = doc.css('div.mainlinks a').map do |rece|
    puts rece.content
  end
end