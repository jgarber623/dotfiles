namespace :node do
  desc 'Install common Node packages'
  task :install_packages do
    prompt 'Are you sure you want to install Node packages? [Yn]'

    case $stdin.gets.chomp
    when 'Y'
      prompt 'Installing Node packages...'

      sh "npm install -g changelog.md fast-cli npm pa11y sass-lint snyk svgo vtop"
    else
      prompt 'Skipping Node package installation...', 37
    end
  end
end

task node: 'node:install_packages'
