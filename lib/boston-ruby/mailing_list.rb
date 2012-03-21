#!/usr/bin/env ruby

# CHANGEME
if ARGV[0] == '-o'
  `open http://groups.google.com/group/boston-rubygroup`
  exit
end

require 'nokogiri'
require 'htmlentities'
require 'date'
xml = `curl1  -s http://groups.google.com/group/boston-rubygroup/feed/atom_v1_0_msgs.xml?num=50`

doc = Nokogiri::XML.parse xml

threads = Hash.new

doc.search('entry').reverse.each {|entry|
  title = entry.at('title').inner_text
  thread_link = entry.at('link')[:href].sub(/\/[^\/]*$/, '')
  data = { 
    author: entry.at('author/name/text()').to_s,
    updated: DateTime.parse(entry.at('updated/text()').to_s),
    link_id: entry.at('link')[:href][/\/([^\/]*)\?/, 1],
    summary: entry.at('summary').inner_text.gsub("<br>", " ").gsub(/\s{2,}/, ' ').strip,
  }
  thread_uid = thread_link[/[^\/]+$/, 0]
  threads[thread_uid] ||= ({title: nil, posts: []})
  threads[thread_uid][:title] ||= title
  threads[thread_uid][:link] ||= thread_link
  threads[thread_uid][:posts] << data
}
require 'yaml'


screen_width = 80

threads.each do |uid, thread|
  puts
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
    decoded = coder.decode html.inner_text
    timestamp = post[:updated].strftime("%m/%d %I:%M %p")
    body = "#{decoded} (#{timestamp})"
    body_width = screen_width - longest_name_length - 2
    wrapped_body_lines = body.gsub(/\n/, " ").gsub(/.{1,#{body_width}}(?:\s|\Z)/){$&+"\n"}.split(/\n/)
    puts "%#{longest_name_length}s | %s" % [post[:author], wrapped_body_lines.shift]
    wrapped_body_lines.each do |line|
      puts "%#{longest_name_length}s | %s" % [" ", line]
    end
    puts

  end

end
