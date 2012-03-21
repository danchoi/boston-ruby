# encoding: UTF-8

require 'open-uri'
require 'nokogiri'

html = open("http://bostonrb.org/").read
doc = Nokogiri::HTML(html)
xs = doc.search('article')

puts xs[0].at("header h2").inner_text
puts
xs[0].search('section').each do |section|
  puts section.inner_text.gsub(/^\s+/, '')
  puts 
end

where = xs[2].at('p')
puts where.inner_text.gsub(/^\s+/, '')
signup = where.search("a")[1]
if signup
  puts "\n#{signup.inner_text}: #{signup[:href]}"
end

