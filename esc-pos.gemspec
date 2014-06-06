lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'esc-pos/version'

Gem::Specification.new do |spec|

  spec.name = 'esc-pos'
  spec.version = ESC_POS::VERSION
  spec.authors = ['Adrian Gomez']
  spec.date = '2014-06-05'
  spec.summary = 'Helpers to aid in the generation of ESC/POS templates.'
  spec.description   = <<-DESCRIPTION
    Provides helpers to generate ESC/POS templates without having to write the hex commands
    manually.
  DESCRIPTION
  spec.email = 'adrian_g171@hotmail.com'
  spec.extra_rdoc_files = %w[LICENSE README.md]
  spec.files = %w[
    Gemfile
    LICENSE
    README.md
    esc-pos.gemspec
    lib/esc-pos.rb
    lib/esc-pos/settings.rb
    lib/esc-pos/version.rb
    lib/esc-pos/specifications/base.rb
    lib/esc-pos/specifications/epson.rb
    lib/esc-pos/specifications/epson/tm_u220.rb
  ]
  spec.homepage = 'https://github.com/adrian-gomez/esc-pos'
  spec.licenses = %w[MIT]
  spec.require_paths = %w[lib]

end