require 'rake'
require 'erb'

def link_file(file_path, file_name)
  link = File.join(ENV['HOME'], ".#{file_name}")

  if file_path =~ /\.erb\.symlink$/
    prompt "Generating ~/.#{file_name}..."

    File.write link, ERB.new(File.read(file_path)).result(binding)
  else
    prompt "Symlinking ~/.#{file_name}..."

    FileUtils.ln_sf File.join(ENV['PWD'], file_path), link
  end
end

def prompt(msg, code = 32)
  puts "\033[#{code}m#{msg}\033[0m"
end

namespace :dotfiles do
  desc 'Install dotfile symlinks into ~'
  task :install do
    file_paths = Dir.glob('*/**{.symlink}')

    file_paths.each do |file_path|
      file_name = File.basename(file_path).sub(/(?:\.erb)?\.symlink$/, '')
      link = File.join(ENV['HOME'], ".#{file_name}")

      if File.exist?(link)
        prompt "~/.#{file_name} already exists! Overwrite this file? [Yn]"

        case $stdin.gets.chomp
        when 'Y'
          prompt "Overwriting ~/.#{file_name}..."

          FileUtils.rm_rf link

          link_file file_path, file_name
        else
          prompt "Skipping ~/.#{file_name}...", 37
        end
      else
        link_file file_path, file_name
      end
    end
  end

  desc 'Removes dotfile symlinks from ~'
  task :uninstall do
    prompt 'Are you sure you want to remove symlinks from ~? [Yn]'

    case $stdin.gets.chomp
    when 'Y'
      prompt 'Removing symlinks from ~...'

      file_paths = Dir.glob('*/**{.symlink}')

      file_paths.each do |file_path|
        full_path = File.join(ENV['HOME'], ".#{File.basename(file_path).sub(/(?:\.erb)?\.symlink/, '')}")

        FileUtils.rm(full_path) if File.symlink?(full_path)
      end
    else
      prompt 'Skipping symlink removal...', 37
    end
  end
end

namespace :homebrew do
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

namespace :oh_my_zsh do
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

task default: 'oh_my_zsh:install'
