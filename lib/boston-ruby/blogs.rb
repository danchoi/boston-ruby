require 'open-uri'
require 'json'
require 'date'
require 'boston-ruby'
require 'yaml'

posts = JSON.parse(open("http://ruby.bostonstuff.org/blog_posts").read)

puts "(Most recent post is last.)"
puts
longest_name_length = posts.reduce(0) {|max, post| [max, post['blog'].length].max}

posts.map {|post| post.merge(parsed_time: DateTime.parse(post['date']))}.
  sort_by {|p| p[:parsed_time]}.each do |post|
  text = [post['title'], post['summary'], post['href']].join("\n\n")
  time = post[:parsed_time]

  puts post['blog'] 
  puts post['date_string'] 
  puts post['title'] 
  puts post["href"]
  puts '-' * 3
end

__END__

Each blog:

- blog: ActBlueTechBlog
  href: http://blog.actbluetech.com/2011/07/come-work-with-us.html
  title: Come Work With Us
  author: Bill Kirtley
  date: '2011-07-29 15:22:05 -0400'
  summary: ActBlue is the leading source of online funds for the Democratic Party
    and an innovator in the field of grassroots politics. We build tools that are
    used by hundreds of thousands of people to change the country everyday. We're
    an established player (eight years strong!) gearing up to make a huge impact on
    the 2012 election season....and we need you...
  feed_url: http://blog.actbluetech.com/atom.xml
  date_string: Jul 29 03:22 PM
