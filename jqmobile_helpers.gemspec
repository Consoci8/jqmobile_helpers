# Provide a simple gemspec so you can easily use your enginex
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "jqmobile_helpers"
  s.summary = "jqmobile_helpers are view helpers for jquery mobile components"
  s.description = "jqmobile_helpers are view helpers for jquery mobile components e.g list view, buttons."
  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc", "Gemfile"] + Dir["test/**/*"] + Dir["rdoc/**/*"]
  s.version = "0.0.1"
end