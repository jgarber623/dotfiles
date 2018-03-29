require 'modules/promptable'

namespace :node do
  include Promptable

  DEFAULT_NODE_PACKAGES = %w(
    @sonarwhal/configuration-web-recommended
    eslint
    eslint-plugin-frontmatter
    fast-cli
    imaging-heap
    npm
    pa11y
    sass-lint
    snyk
    sonarwhal
    svgo
    vtop
  )

  desc 'Install common Node packages'
  task :packages do
    prompt 'Are you sure you want to install Node packages? [Yn]'

    return prompt('Skipping Node package installation...', 37) unless $stdin.gets.chomp == 'Y'

    prompt 'Installing Node packages...'

    sh "npm install -g #{DEFAULT_NODE_PACKAGES.join(' ')}"
  end
end

task node: 'node:packages'
