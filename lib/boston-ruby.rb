# encoding: UTF-8
require 'htmlentities'

module BostonRuby

  VERSION = '0.0.8'

  MAX_WIDTH = 90
  CODER = HTMLEntities.new
  
  def self.format_item(longest_name_length, author, text, time, time_on_left=false)
    timestamp = time.strftime("%I:%M%p %m/%d")
    body_width = MAX_WIDTH - timestamp.length - longest_name_length - 4
    wrapped_body_lines = CODER.decode(text).gsub(/\n/, " ").gsub(/.{1,#{body_width}}(?:\s|\Z)/){$&+"\n"}.split(/\n/)
    
    out = []
    if time_on_left
      longest_name_length = [longest_name_length, timestamp.length].max
      out <<  "%#{longest_name_length}s : %-#{body_width + 1}s" % [author, wrapped_body_lines.shift]
      out <<  "%#{longest_name_length}s : %-#{body_width + 1}s" % [timestamp, wrapped_body_lines.shift]
      wrapped_body_lines.each do |line|
        out << "%#{longest_name_length}s : %-#{body_width + 1}s" % [" ", line]
      end
    else
      out <<  "%#{longest_name_length}s : %-#{body_width + 1}s : %s" % [author, wrapped_body_lines.shift, timestamp]
      wrapped_body_lines.each do |line|
        out << "%#{longest_name_length}s : %-#{body_width + 1}s :" % [" ", line]
      end
    end
    out.join("\n")
  end

end
