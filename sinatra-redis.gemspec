Gem::Specification.new do |s|
  s.name        = "sinatra-redis"
  s.description = "Redis module for Sinatra"
  s.summary     = s.description
  s.authors     = ["Alyssa Herzog"]
  s.email       = "alyssadaemon@gmail.com"
  s.version     = "0.0.1"
  s.date        = "2016-07-09"
  s.license     = "MIT"
  s.files       = %w(Gemfile LICENSE sinatra-redis.gemspec) + Dir["lib/**/*"]
  s.required_ruby_version = '>= 2.2.0'
  s.add_dependency "sinatra", '~> 2.0'
  s.add_dependency "redis", '~> 3.2'
end