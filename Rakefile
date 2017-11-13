lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'erb'
require 'rake'

Dir.glob('lib/rake/*.rake').each { |r| import r }

task default: :oh_my_zsh
