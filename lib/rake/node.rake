require 'modules/promptable'

namespace :node do
  include Promptable

  desc 'Install common Node packages'
  task :packages do
    prompt 'Are you sure you want to install Node packages? [Yn]'

    return prompt('Skipping Node package installation...', 37) unless $stdin.gets.chomp == 'Y'

    prompt 'Installing Node packages...'

    sh 'npm install -g changelog.md eslint fast-cli npm pa11y sass-lint snyk svgo vtop'
  end
end

task node: 'node:packages'
