# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sinatra-redirect-with-flash}
  s.version = "0.2.1"

  s.authors = ["Vasily Polovnyov"]
  s.license = 'MIT'
  s.summary = s.description = %q{redirect with flash helper for Sinatra}
  s.email = %q{vasily@polovnyov.ru}
  s.homepage = %q{http://github.com/vast/sinatra-redirect-with-flash}

  s.require_paths = ["lib"]

  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]

  s.files = [
    "LICENSE",
    "README.md",
    "Rakefile",
    "lib/sinatra/redirect_with_flash.rb",
    "test/sinatra_app.rb",
    "test/sinatra_redirect_with_flash_test.rb"
  ]

  s.test_files = [
    "test/sinatra_app.rb",
    "test/sinatra_redirect_with_flash_test.rb"
  ]

  s.add_runtime_dependency(%q<sinatra>, [">= 1.0.0"])
  s.add_development_dependency(%q<rack-test>, [">= 0.3.0"])
  s.add_development_dependency(%q<sinatra-flash>, [">= 0.3.0"])
end

