require 'modules/promptable'

namespace :node do
  include Promptable

  GLOBAL_NODE_PACKAGES = %w(
    changelog.md
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

  desc 'Install common Node packages'
  task :packages do
    prompt 'Are you sure you want to install Node packages? [Yn]'

    return prompt('Skipping Node package installation...', 37) unless $stdin.gets.chomp == 'Y'

    prompt 'Installing Node packages...'

    sh "npm install -g #{GLOBAL_NODE_PACKAGES.join(' ')}"
  end
end

task node: 'node:packages'
