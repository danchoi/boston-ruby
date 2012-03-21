#!/usr/bin/env ruby

if ARGV[0] == '-o'
  `open http://groups.google.com/group/boston-rubygroup`
  exit
end
require 'nokogiri'
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
  threads[thread_uid][:posts] << data

=begin
  puts '-' * 72
  puts "%s | %s | %s | %s" % [author, title, updated.strftime("%m/%d %I:%M %p"), link_id]
  puts summary
  puts link
=end
}
require 'yaml'
puts threads.to_yaml
