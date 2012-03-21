# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "boston-stitch"
  s.version     = '0.0.6'
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.0'

  s.authors     = ["Daniel Choi"]
  s.email       = ["dhchoi@gmail.com"]
  s.homepage    = "http://github.com/danchoi/boston-stitch"
  s.summary     = %q{Stitch together all the pages of a Boston.com gallery}
  s.description = %q{Stitch together all the pages of a Boston.com gallery}

  s.rubyforge_project = "boston-stitch"

  s.test_files    = []
  s.executables   = ['boston-stitch']

  s.add_dependency 'haml'
  s.add_dependency 'nokogiri'
  s.add_dependency 'sinatra'
end
