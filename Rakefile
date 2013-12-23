require 'rake'
require 'erb'
require 'yaml'

config = YAML.load_file('config.yml')
dotfiles = Dir.glob('*/**{.symlink}')

def colorize(out, code = 34)
  "\033[#{code}m#{out}\033[0m"
end

def link_file(file, filename, target)
  if file =~ /.erb.symlink$/
    puts "Generating ~/.#{filename}..."

    File.open(target, 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "Linking ~/.#{filename}..."
    system "ln -fs $PWD/#{file} #{target}"
  end
end

desc 'Installs dotfiles symlinks into user\'s home directory'
task :install do
  dotfiles.each do |file|
    filename = file.split('/').last.split('.').first
    target = "#{ENV["HOME"]}/.#{filename}"

    if File.exists?(target) || File.symlink?(target)
      puts "~/.#{filename} already exists! Do you want to [o]verwrite or [s]kip this file?"

      case STDIN.gets.chomp
        when 'o'
          system "rm -rf #{target}"
          link_file(file, filename, target)
        else
          puts "Skipping ~/.#{filename}."
      end
    else
      link_file(file, filename, target)
    end
  end
end

desc 'Switches shell to ZSH'
task :switch_shell do
  puts 'Would you like to switch your shell to ZSH? [yn]'
  case STDIN.gets.chomp
    when 'y'
      system "sudo -s 'echo \"/usr/local/bin/zsh\" >> /etc/shells'"
      system 'chsh -s /usr/local/bin/zsh'
      puts 'You\'re now using ZSH! Restart your shell for this change to take effect.'
    else
      puts 'Keeping your current shell.'
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
    puts 'Installing Homebrew...'
    system 'ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"'
  end

  desc 'Installs several useful formulae'
  task :install_formulae do
    puts colorize('Updating Homebrew...')
    system 'brew update'

    puts colorize('Upgrading existing formulae...')
    system 'brew upgrade'

    puts colorize('Tapping homebrew/dupes...')
    system 'brew tap homebrew/dupes'

    puts colorize('Tapping phinze/homebrew-cask...')
    system 'brew tap phinze/homebrew-cask'

    config['formulae'].each do |formula|
      puts colorize("Installing #{formula}...")
      system "brew install #{formula}"
    end

    config['casks'].each do |cask|
      puts colorize("Installing #{cask}...")
      system "brew cask install #{cask}"
    end

    puts colorize('Taking out the trash...')
    system 'brew cleanup'
  end
end

task :default => 'install'
task :homebrew => 'homebrew:install'
