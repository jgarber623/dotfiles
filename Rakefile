require 'rake'
require 'erb'

dotfiles = Dir.glob('*/**{.symlink}')

def link_file(file, filename, target)
  if file =~ /.erb.symlink$/
    prmpt "Generating ~/.#{filename}..."

    File.open(target, 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    prmpt "Linking ~/.#{filename}..."
    system "ln -fs $PWD/#{file} #{target}"
  end
end

def prmpt(out, code = 32)
  puts "\033[#{code}m#{out}\033[0m"
end

desc 'Installs dotfiles symlinks into user\'s home directory'
task :install do
  dotfiles.each do |file|
    filename = file.split('/').last.split('.').first
    target = "#{ENV["HOME"]}/.#{filename}"

    if File.exists?(target) || File.symlink?(target)
      prmpt "~/.#{filename} already exists! Do you want to [o]verwrite or [s]kip this file?"

      case STDIN.gets.chomp
        when 'o'
          system "rm -rf #{target}"
          link_file(file, filename, target)
        else
          prmpt("Skipping ~/.#{filename}.", 37)
      end
    else
      link_file(file, filename, target)
    end
  end
end

desc 'Switches shell to ZSH'
task :chsh do
  prmpt 'Would you like to switch your shell to ZSH? [Yn]'
  case STDIN.gets.chomp
    when 'Y'
      system "sudo -s 'echo \"/usr/local/bin/zsh\" >> /etc/shells'"
      system 'chsh -s /usr/local/bin/zsh'
      prmpt 'You\'re now using ZSH! Restart your shell for this change to take effect.'
    else
      prmpt('Keeping your current shell.', 37)
  end
end

desc 'Removes dotfiles symlinks from user\'s home directory'
task :uninstall do
  dotfiles.each do |file|
    link = File.expand_path("~/.#{file}")

    if File.symlink?(link)
      system "rm #{link}"
    end
  end
end

namespace :homebrew do
  desc 'Installs Homebrew'
  task :install do
    system 'ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"'
  end

  desc 'Installs formulae defined in Brewfile'
  task :bundle do
    system 'brew bundle'
  end
end

task :default => 'install'
task :homebrew => 'homebrew:install'
