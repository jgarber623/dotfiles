require 'modules/promptable'

namespace :ruby do
  include Promptable

  desc 'Install latest Ruby and set global default'
  task :install do
    prompt 'Are you sure you want to install Ruby 2.5.0? [Yn]'

    return prompt('Skipping Ruby 2.5.0 installation...', 37) unless $stdin.gets.chomp == 'Y'

    prompt 'Installing Ruby 2.5.0...'

    sh 'rbenv install 2.5.0'
    sh 'rbenv global 2.5.0'
  end

  desc 'Install common Ruby gems'
  task :gems do
    prompt 'Are you sure you want to install Ruby gems? [Yn]'

    return prompt('Skipping Ruby gem installation...', 37) unless $stdin.gets.chomp == 'Y'

    prompt 'Installing Ruby gems...'

    sh 'gem update --system'
    sh 'gem install bundler travis'
  end
end

task ruby: 'ruby:install'
