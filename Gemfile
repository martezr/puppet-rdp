source ENV['GEM_SOURCE'] || "https://rubygems.org"

def location_for(place, fake_version = nil)
  if place =~ /^(git:[^#]*)#(.*)/
    [fake_version, { :git => $1, :branch => $2, :require => false }].compact
  elsif place =~ /^file:\/\/(.*)/
    ['>= 0', { :path => File.expand_path($1), :require => false }]
  else
    [place, { :require => false }]
  end
end

# metadata.json lint gem
gem 'metadata-json-lint'

# rake gem for running tests
gem 'rake'

# rspec gem for rspec tests
gem "rspec"

# rspec-puppet gem for extending rspec functionality to support puppet
gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet.git'

# spec_helper gem to add additional spec functionality
gem 'puppetlabs_spec_helper'

# rspec-puppet-facts gem for utilizing facts in rspec tests
gem 'rspec-puppet-facts'

# simplecov for code coverage
gem 'simplecov'

# simplecov-console gem for code coverage output formatter
gem 'simplecov-console'

# rubocop for static code analyzer
gem 'rubocop'

# Install the defined version of facter
if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion, :require => false
else
  gem 'facter', :require => false
end

# Install the defined version of Puppet
if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

# vim:ft=ruby
