# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require 'boston-ruby'

Gem::Specification.new do |s|
  s.name        = "boston-ruby"
  s.version     = BostonRuby::VERSION
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.0'

  s.authors     = ["Daniel Choi"]
  s.email       = ["dhchoi@gmail.com"]
  s.homepage    = "http://github.com/danchoi/boston-ruby"
  summary = %q{Track BostonRB group and member activity}
  s.summary     = summary
  s.description = summary

  s.rubyforge_project = "boston-ruby"

  s.test_files    = []
  s.executables   = ['boston-ruby']

  s.add_dependency 'nokogiri'
  s.add_dependency 'htmlentities'
end
