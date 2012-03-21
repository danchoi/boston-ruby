# encoding: UTF-8
require 'open-uri'
require 'json'
require 'date'
require 'boston-ruby'

tweets = JSON.parse(open("http://ruby.bostonstuff.org/tweets?raw=true").read)

longest_name_length = tweets.reduce(0) {|max, post| [max, post['user_screen_name'].length].max}

puts "(Most recent tweet is last.)"
puts

tweets.map {|post| post.merge(parsed_time: DateTime.parse(post['created_at']))}.
  sort_by {|p| p[:parsed_time]}.each do |post|
  author = post['user_screen_name'] 
  text = post['text']
  time = post[:parsed_time]
  puts BostonRuby.format_item(longest_name_length, author, text, time)
  puts
end

__END__

Each tweet:


---
- id: 182473702477283329
  created_at: '2012-03-21 10:28:15 -0400'
  user_screen_name: patricksroberts
  user_profile_image_url: http://a0.twimg.com/profile_images/1807338004/small_avatar_normal.jpg
  user_description: Software Developer @ Iora Health, Co-organizer of BostonRB
  user_location: Cambridge, MA
  user_followers_count: 145
  text: Converting JS to coffee.  SO GOOD.
  retweet_count: 0
