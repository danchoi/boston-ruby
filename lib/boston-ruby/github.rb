# encoding: UTF-8
require 'open-uri'
require 'json'
require 'date'
require 'boston-ruby'
require 'yaml'

updates = JSON.parse(open("http://ruby.bostonstuff.org/updates").read)

puts "(Most recent update is last.)"
puts

longest_name_length = updates.reduce(0) {|max, x| [max, x['author'].length].max}

updates.reverse.each do |update|
  author = update['author'] 
  #text = [update['title'], update['content']].join("\n\n")
  text = update['title']
  time = DateTime.parse update['date']
  puts BostonRuby.format_item(longest_name_length, author, text, time)
end

__END__

- update_id: tag:github.com,2008:PushEvent/1532252526
  author: trevorrjohn
  date: '2012-03-20 16:37:45 -0400'
  title: trevorrjohn pushed to master at trevorrjohn/vim-config
  content: ! "      <span class=\"mini-icon push\"></span>\n      \n      <div class=\"title\">\n
    \       <a href=\"https://github.com/trevorrjohn\">trevorrjohn</a> <span>pushed</span>
    to master at <a href=\"https://github.com/trevorrjohn/vim-config\">trevorrjohn/vim-config</a>\n
    \       <time class=\"js-relative-date\" datetime=\"2012-03-20T20:37:45Z\" title=\"2012-03-20
    20:37:45\"></time>\n      </div>\n      <div class=\"details\">\n        \n      \n
    \       <div class=\"commits\">\n          <ul>\n            <li>\n            <a
    href=\"https://github.com/trevorrjohn\" class=\"committer\">trevorrjohn</a> committed
    <a href=\"https://github.com/trevorrjohn/vim-config/commit/bac294aef9ef746ca8110656962e6c10955d2e8e\">bac294a</a>\n
    \     \n              <div class=\"message\">\n                <blockquote>updated
    command-t install instructions</blockquote>\n              </div>\n            </li>\n
    \         </ul>\n        </div>\n      </div>\n"
  media: https://secure.gravatar.com/avatar/78a67425fcb9730d29ab6a59710fe35e?s=30&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png
  date_string: Mar 20 04:37 PM


