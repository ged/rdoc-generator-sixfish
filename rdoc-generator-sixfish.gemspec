# -*- encoding: utf-8 -*-
# stub: rdoc-generator-sixfish 0.2.0.pre.20221115154358 ruby lib

Gem::Specification.new do |s|
  s.name = "rdoc-generator-sixfish".freeze
  s.version = "0.2.0.pre.20221115154358"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://todo.sr.ht/~ged/Sixfish", "documentation_uri" => "https://deveiate.org/code/sixfish", "homepage_uri" => "https://hg.sr.ht/~ged/Sixfish", "source_uri" => "https://hg.sr.ht/~ged/Sixfish" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Granger".freeze]
  s.date = "2022-11-15"
  s.description = "A readable HTML generator for RDoc. It uses the Bulma CSS framework.".freeze
  s.email = ["ged@faeriemud.org".freeze]
  s.files = ["History.md".freeze, "README.md".freeze, "data/rdoc-generator-sixfish/css/fa-solid-900.515704be.ttf".freeze, "data/rdoc-generator-sixfish/css/fa-solid-900.7ba04835.svg".freeze, "data/rdoc-generator-sixfish/css/fa-solid-900.8c589fd1.eot".freeze, "data/rdoc-generator-sixfish/css/fa-solid-900.c7b072c6.woff".freeze, "data/rdoc-generator-sixfish/css/fa-solid-900.f2049a98.woff2".freeze, "data/rdoc-generator-sixfish/css/sixfish.css".freeze, "data/rdoc-generator-sixfish/css/sixfish.css.map".freeze, "data/rdoc-generator-sixfish/js/sixfish.js".freeze, "data/rdoc-generator-sixfish/js/sixfish.js.map".freeze, "data/rdoc-generator-sixfish/templates/class.tmpl".freeze, "data/rdoc-generator-sixfish/templates/file.tmpl".freeze, "data/rdoc-generator-sixfish/templates/index.tmpl".freeze, "data/rdoc-generator-sixfish/templates/layout.tmpl".freeze, "lib/inversion/template/striptag.rb".freeze, "lib/rdoc/discover.rb".freeze, "lib/rdoc/generator/sixfish.rb".freeze, "lib/sixfish.rb".freeze, "lib/sixfish/patches.rb".freeze, "spec/helpers.rb".freeze, "spec/rdoc/generator/sixfish_spec.rb".freeze, "spec/sixfish_spec.rb".freeze]
  s.homepage = "https://hg.sr.ht/~ged/Sixfish".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.rubygems_version = "3.3.7".freeze
  s.summary = "A readable HTML generator for RDoc.".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<inversion>.freeze, ["~> 1.3"])
    s.add_runtime_dependency(%q<loggability>.freeze, ["~> 0.18"])
    s.add_runtime_dependency(%q<rdoc>.freeze, ["~> 6.4"])
    s.add_development_dependency(%q<rake-deveiate>.freeze, ["~> 0.19"])
    s.add_development_dependency(%q<rdoc-generator-fivefish>.freeze, ["~> 0.4"])
  else
    s.add_dependency(%q<inversion>.freeze, ["~> 1.3"])
    s.add_dependency(%q<loggability>.freeze, ["~> 0.18"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 6.4"])
    s.add_dependency(%q<rake-deveiate>.freeze, ["~> 0.19"])
    s.add_dependency(%q<rdoc-generator-fivefish>.freeze, ["~> 0.4"])
  end
end
