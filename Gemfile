source 'https://rubygems.org'

group :development, :test do
  gem 'rake'
  gem 'puppet-lint'
  gem 'rspec', '< 3.2.0', {"platforms"=>["ruby_18"]}
  gem 'rspec-puppet',           '=1.0.1'
  gem 'puppetlabs_spec_helper'
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

gem 'hiera-puppet', :require => false
