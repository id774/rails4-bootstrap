#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

# encoding: utf-8

require File.expand_path('../config/application', __FILE__)
Rails4Bootstrap::Application.load_tasks

require 'rubygems'
require 'rspec/core'
require 'rspec/core/rake_task'

task :spec do
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.rspec_opts = ["-c","-fs"]
    spec.pattern = FileList['spec/**/*_spec.rb']
  end
end

unless /^1\.8\./ =~ RUBY_VERSION
  desc "Run RSpec code examples with simplecov"
  task :simplecov do
    ENV['COVERAGE'] = "on"
    Rake::Task[:spec].invoke
  end
else
  desc "Run RSpec code examples with rcov"
  RSpec::Core::RakeTask.new(:rcov) do |spec|
    spec.pattern = FileList['spec/**/*_spec.rb']
    exclude_files = [
      "gems",
    ]
    spec.rcov_opts = ['--exclude', exclude_files.join(",")]
    spec.rcov = true
  end
end
