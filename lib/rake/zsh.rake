require 'modules/promptable'

namespace :zsh do
  include Promptable

  desc 'Install oh-my-zsh, a community-driven framework for managing your ZSH configuration'
  task :install do
    prompt 'Are you sure you want to install oh-my-zsh? [Yn]'

    return prompt('Skipping oh-my-zsh installation...', 37) unless $stdin.gets.chomp == 'Y'

    prompt 'Installing oh-my-zsh...'

    sh 'git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh'
  end

  desc 'Uninstall oh-my-zsh'
  task :uninstall do
    prompt 'Are you sure you want to uninstall oh-my-zsh? [Yn]'

    return prompt('Skipping oh-my-zsh uninstallation...', 37) unless $stdin.gets.chomp == 'Y'

    prompt 'Uninstalling oh-my-zsh...'

    sh 'uninstall_oh_my_zsh'
  end
end

task zsh: 'zsh:install'
