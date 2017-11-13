require 'modules/linkable'
require 'modules/promptable'

namespace :oh_my_zsh do
  include Linkable
  include Promptable

  desc 'Install oh-my-zsh, a community-driven framework for managing your ZSH configuration'
  task :install do
    prompt 'Are you sure you want to install oh-my-zsh? [Yn]'

    case $stdin.gets.chomp
    when 'Y'
      prompt 'Installing oh-my-zsh...'

      sh 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
    else
      prompt 'Skipping oh-my-zsh installation...', 37
    end
  end

  desc 'Install custom oh-my-zsh theme'
  task :install_theme do
    prompt 'Installing custom oh-my-zsh theme...'

    theme_path = 'oh-my-zsh/custom/jgarber.zsh-theme'

    link_file theme_path, theme_path
  end

  desc 'Uninstall oh-my-zsh'
  task :uninstall do
    prompt 'Are you sure you want to uninstall oh-my-zsh? [Yn]'

    case $stdin.gets.chomp
    when 'Y'
      prompt 'Uninstalling oh-my-zsh...'

      sh 'uninstall_oh_my_zsh'
    else
      prompt 'Skipping oh-my-zsh uninstallation...', 37
    end
  end
end

task oh_my_zsh: 'oh_my_zsh:install'
