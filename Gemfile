source 'https://rubygems.org'

gem 'emeril', :group => :release

group :test do
  gem 'kitchen-docker'
  gem 'librarian-chef'
end

group :lint do
  gem 'foodcritic', '~> 5.0'
  gem 'rubocop', '~> 0.34'
end

group :unit do
  gem 'berkshelf',  '~> 4.0'
  gem 'chefspec',   '~> 4.4'
end

group :kitchen_common do
  gem 'test-kitchen', '~> 1.4'
end

group :kitchen_vagrant do
  gem 'kitchen-vagrant', '~> 0.19'
end
