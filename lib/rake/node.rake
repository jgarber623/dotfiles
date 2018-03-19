require 'modules/promptable'

namespace :node do
  include Promptable

  NVM_VERSION = 'v0.33.8'.freeze
  DEFAULT_NODE_VERSION = 'v9.6.1'.freeze

  DEFAULT_NODE_PACKAGES = %w(
    eslint
    eslint-plugin-frontmatter
    fast-cli
    npm
    pa11y
    sass-lint
    snyk
    svgo
    vtop
  )

  desc 'Install Node and set global default'
  task :install do
    prompt "Are you sure you want to install Node #{DEFAULT_NODE_VERSION}? [Yn]"

    return prompt("Skipping Node #{DEFAULT_NODE_VERSION} installation...", 37) unless $stdin.gets.chomp == 'Y'

    prompt "Installing Node #{DEFAULT_NODE_VERSION}..."

    sh "git clone -b #{NVM_VERSION} https://github.com/creationix/nvm.git ~/.nvm"

    sh "source ~/.nvm/nvm.sh && \
        nvm install #{DEFAULT_NODE_VERSION} \
        && nvm alias default #{DEFAULT_NODE_VERSION}"
  end

  desc 'Install common Node packages'
  task :packages do
    prompt 'Are you sure you want to install Node packages? [Yn]'

    return prompt('Skipping Node package installation...', 37) unless $stdin.gets.chomp == 'Y'

    prompt 'Installing Node packages...'

    sh "npm install -g #{DEFAULT_NODE_PACKAGES.join(' ')}"
  end
end

task node: 'node:packages'
