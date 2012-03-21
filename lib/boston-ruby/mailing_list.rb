#!/usr/bin/env ruby
# encoding: UTF-8
require 'nokogiri'
require 'date'
require 'boston-ruby'
require 'time'

xml = `curl -A "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092416 Firefox/3.0.3" -s http://groups.google.com/group/boston-rubygroup/feed/atom_v1_0_msgs.xml?num=50`
doc = Nokogiri::XML.parse xml

threads = Hash.new

doc.search('entry').each {|entry|
  title = entry.at('title').inner_text
  thread_link = entry.at('link')[:href].sub(/\/[^\/]*$/, '')
  date_s = entry.at('updated/text()').to_s
  updated = Time.parse(date_s).localtime
  data = { 
    author: entry.at('author/name/text()').to_s,
    updated: updated,
    link_id: entry.at('link')[:href][/\/([^\/]*)\?/, 1],
    summary: entry.at('summary').inner_text.gsub("<br>", " ").gsub(/\s{2,}/, ' ').strip,
  }
  thread_uid = thread_link[/[^\/]+$/, 0]
  threads[thread_uid] ||= ({title: nil, posts: []})
  threads[thread_uid][:title] ||= title
  threads[thread_uid][:link] ||= thread_link
  threads[thread_uid][:posts] << data
}

puts "(Most recently updated thread is last.)"
puts
threads.to_a.reverse.each do |uid, thread|
  puts thread[:title]  
  puts '-' * thread[:title].size
  puts thread[:link]
  puts

  longest_name_length = thread[:posts].reduce(0) {|max, post| [max, post[:author].length].max}

  thread[:posts].each do |post|
    
    # turn links into markdown-esque text
    html = Nokogiri::HTML(post[:summary])
    html.search('a').each do |a|
      a.swap("[#{a[:href]}]")
    end
    coder = HTMLEntities.new
    text = coder.decode html.inner_text
    time = post[:updated]
    author = post[:author]
    
    puts BostonRuby.format_item(longest_name_length, author, text, time, true)
    puts

  end
  puts

end
