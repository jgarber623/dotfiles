require 'modules/promptable'

namespace :ruby do
  include Promptable

  DEFAULT_RUBY_GEMS = %w(
    bundler
    travis
  )

  GLOBAL_RUBY_VERSION = '2.5.0'.freeze

  desc 'Install latest Ruby and set global default'
  task :install do
    prompt "Are you sure you want to install Ruby #{GLOBAL_RUBY_VERSION}? [Yn]"

    return prompt("Skipping Ruby #{GLOBAL_RUBY_VERSION} installation...", 37) unless $stdin.gets.chomp == 'Y'

    prompt "Installing Ruby #{GLOBAL_RUBY_VERSION}..."

    sh "rbenv install #{GLOBAL_RUBY_VERSION}"
    sh "rbenv global #{GLOBAL_RUBY_VERSION}"
  end

  desc 'Install common Ruby gems'
  task :gems do
    prompt 'Are you sure you want to install Ruby gems? [Yn]'

    return prompt('Skipping Ruby gem installation...', 37) unless $stdin.gets.chomp == 'Y'

    prompt 'Installing Ruby gems...'

    sh 'gem update --system'
    sh "gem install #{DEFAULT_RUBY_GEMS.join(' ')}"
  end
end

task ruby: 'ruby:install'
