# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "slip"
  gem.homepage = "http://github.com/func-i/slip"
  gem.license = "MIT"
  gem.summary = %Q{Ruby wrapper for Slideshare.net API}
  gem.description = %Q{A Ruby wrapper for the slideshare.net API located at http://www.slideshare.net/developers}
  gem.email = "jon@func-i.com"
  gem.authors = ["Sailias"]
  # dependencies defined in Gemfile
end

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end
Jeweler::RubygemsDotOrgTasks.new