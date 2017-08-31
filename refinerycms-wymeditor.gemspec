# Encoding: UTF-8
Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = %q{refinerycms-wymeditor}
  s.version           = '2.0.0'
  s.summary           = %q{WYMeditor support for Refinery CMS}
  s.description       = %q{This extension adds WYMeditor support to Refinery CMS for visual editing.}
  s.email             = %q{gems@p.arndt.io}
  s.homepage          = %q{https://manuka.co}
  s.authors           = ['Philip Arndt']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)

  s.files             = `git ls-files -- '*[^.pem]'`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  s.add_dependency    'refinerycms-core', ['>= 4.0.0.dev', '< 5.0']

  s.cert_chain  = ['certs/parndt.pem']
  if $0 =~ /gem\z/ && ARGV.include?("build") && ARGV.include?(__FILE__)
    s.signing_key = File.expand_path("~/.ssh/gem-private_key.pem")
  end
end
