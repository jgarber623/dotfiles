require 'modules/promptable'

namespace :homebrew do
  include Promptable

  desc 'Install Homebrew, the missing package manager for macOS'
  task :install do
    prompt 'Are you sure you want to install Homebrew? [Yn]'

    case $stdin.gets.chomp
    when 'Y'
      prompt 'Installing Homebrew...'

      sh '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
      sh 'brew tap homebrew/bundle'
    else
      prompt 'Skipping Homebrew installation...', 37
    end
  end

  desc 'Install bundled software declared in Brewfile'
  task :bundle do
    prompt 'Are you sure you want to install bundled software? [Yn]'

    case $stdin.gets.chomp
    when 'Y'
      prompt 'Installing bundled software...'

      sh 'brew bundle'
    else
      prompt 'Skipping bundled software installation...', 37
    end
  end
end

task homebrew: 'homebrew:install'
