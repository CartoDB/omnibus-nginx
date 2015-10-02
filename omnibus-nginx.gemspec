# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "omnibus-nginx"
  s.version     = "1.0.0"
  s.authors     = ['CartoDB team']
  s.summary     = %q{Omnibus Nginx web server project}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'berkshelf', '~> 3.1.0'
end
