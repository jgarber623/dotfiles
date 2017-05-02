require 'rake'
require 'erb'

def link_file(file, file_name)
  if file =~ /.erb.symlink$/
    prompt "Generating ~/.#{file_name}..."

    File.open(File.join(ENV['HOME'], ".#{file_name}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    prompt "Linking ~/.#{file_name}..."

    sh "ln -s $PWD/#{file} $HOME/.#{file_name}"
  end
end

def prompt(msg, code = 32)
  puts "\033[#{code}m#{msg}\033[0m"
end

namespace :dotfiles do
  desc 'Install dotfile symlinks into ~'
  task :install do
    files = Dir.glob('*/**{.symlink}')

    files.each do |file|
      file_name = file.split('/').last.sub(/(?:\.erb)?\.symlink/, '')

      if File.exist?(File.join(ENV['HOME'], ".#{file_name}"))
        prompt("~/.#{file_name} already exists! Overwrite this file? [Yn]")

        case $stdin.gets.chomp
        when 'Y'
          prompt("Overwriting ~/.#{file_name}...")

          sh "rm -rf ~/.#{file_name}"
          link_file(file, file_name)
        else
          prompt("Skipping ~/.#{file_name}...", 37)
        end
      else
        link_file(file, file_name)
      end
    end
  end

  desc 'Removes dotfile symlinks from ~'
  task :uninstall do
    prompt('Are you sure you want to remove symlinks from ~? [Yn]')

    case $stdin.gets.chomp
    when 'Y'
      prompt('Removing symlinks from ~...')

      files = Dir.glob('*/**{.symlink}')

      files.each do |file|
        file_path = File.expand_path("~/.#{file.split('/').last.sub(/(?:\.erb)?\.symlink/, '')}")

        if File.symlink?(file_path)
          sh "rm #{file_path}"
        end
      end
    else
      prompt('Skipping symlink removal...', 37)
    end
  end
end

namespace :homebrew do
  desc 'Install Homebrew, the missing package manager for macOS'
  task :install do
    prompt('Are you sure you want to install Homebrew? [Yn]')

    case $stdin.gets.chomp
    when 'Y'
      prompt('Installing Homebrew...')

      sh '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
      sh 'brew tap homebrew/bundle'
      sh 'brew tap homebrew/services'
    else
      prompt('Skipping Homebrew installation...', 37)
    end
  end

  desc 'Install bundled software declared in Brewfile'
  task :bundle do
    prompt('Are you sure you want to install bundled software? [Yn]')

    case $stdin.gets.chomp
    when 'Y'
      prompt('Installing bundled software...')

      sh 'brew bundle'
    else
      prompt('Skipping bundled software installation...', 37)
    end
  end
end

namespace :oh_my_zsh do
  desc 'Install oh-my-zsh, a community-driven framework for managing your ZSH configuration'
  task :install do
    prompt('Are you sure you want to install oh-my-zsh? [Yn]')

    case $stdin.gets.chomp
    when 'Y'
      prompt('Installing oh-my-zsh...')

      sh 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
    else
      prompt('Skipping oh-my-zsh installation...', 37)
    end
  end

  desc 'Install custom oh-my-zsh theme'
  task :install_theme do
    prompt('Installing custom oh-my-zsh theme...')

    theme_path = 'oh-my-zsh/custom/jgarber.zsh-theme'

    sh "ln -fs $PWD/#{theme_path} $HOME/.#{theme_path}"
  end

  desc 'Uninstall oh-my-zsh'
  task :uninstall do
    prompt('Are you sure you want to uninstall oh-my-zsh? [Yn]')

    case $stdin.gets.chomp
    when 'Y'
      prompt('Uninstalling oh-my-zsh...')

      sh 'uninstall_oh_my_zsh'
    else
      prompt('Skipping oh-my-zsh uninstallation...', 37)
    end
  end
end

task default: ['oh_my_zsh:install', 'homebrew:install', 'dotfiles:install']
