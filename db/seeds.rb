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

i=1
doc = Nokogiri::HTML(open('http://www.indianfoodforever.com/'))

results = doc.css('div.top-link a').map do |cname|
  Category.create([name: cname.content])
  recipe = cname.attribute('href').to_s
  #puts recipe
  doc1 = Nokogiri::HTML(open(recipe))
  #puts doc1
  results1 = doc1.css('div.mainlinks a').map do |rece|

    #Recipe.create([category_id: i, name: rece.content])
    #puts rece.content
    recipe1 = rece.attribute('href').to_s
    puts recipe1
    unless recipe1 == "http://www.indianfoodforever.com/muhroom/"
      doc2 = Nokogiri::HTML(open(recipe1))
      results2 = doc2.css('body').map do |rece1|
        ingredients = rece1.css('div.text')
        description = rece1.css('ul')
        #puts ingredients.inner_html
        Recipe.create([category_id: i, name: rece.content, ingredients: ingredients.inner_html, description: description.inner_html])
      end
    end
  end
  i=i+1
end