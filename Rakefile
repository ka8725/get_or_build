# encoding: UTF-8

require "bundler/gem_tasks"
require 'rake/testtask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the get_or_build gem.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end
