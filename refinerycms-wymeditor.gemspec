# Encoding: UTF-8
Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-wymeditor}
  s.version           = '1.0.6'
  s.summary           = %q{WYMeditor support for Refinery CMS}
  s.description       = %q{This extension adds WYMeditor support to Refinery CMS for visual editing.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = ['Philip Arndt']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  s.add_dependency    'refinerycms-core', '~> 3.0', '>= 3.0.0'
end
