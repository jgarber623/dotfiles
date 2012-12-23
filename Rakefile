require 'rake'
require 'erb'

def dotfiles
  Dir.glob( '*/**{.symlink}' )
end

def formulae
  ['apple-gcc42', 'base64', 'git', 'mysql', 'pidof', 'postgresql']
end

def link_file( file, filename, target )
  if file =~ /.erb.symlink$/
    puts "Generating ~/.#{filename}..."
    
    File.open( target, 'w' ) do |new_file|
      new_file.write ERB.new( File.read( file ) ).result( binding )
    end
  else
    puts "Linking ~/.#{filename}..."
    system "ln -fs $PWD/#{file} #{target}"
  end
end

task :default => 'install'

desc 'Installs dotfiles symlinks into user\'s home directory'
task :install do
  dotfiles.each do |file|
    filename = file.split( '/' ).last.split( '.' ).first
    target = "#{ENV["HOME"]}/.#{filename}"
    
    if File.exists?( target ) || File.symlink?( target )
      puts "~/.#{filename} already exists! Do you want to [o]verwrite or [s]kip this file?"
      
      case STDIN.gets.chomp
        when 'o'
          system "rm -rf #{target}"
          link_file( file, filename, target )
        else
          puts "Skipping ~/.#{filename}."
      end
    else
      link_file( file, filename, target )
    end
  end
  
  puts 'Would you like to switch your shell to ZSH? [yn]'
  case STDIN.gets.chomp
    when 'y'
      system 'chsh -s /bin/zsh'
      puts 'You\'re now using ZSH! Restart your shell for this change to take effect.'
    else
      puts 'Keeping your current shell.'
  end
end

desc 'Removes dotfiles symlinks from user\'s home directory'
task :uninstall do
  dotfiles.each do |file|
    link = File.expand_path( "~/.#{file}" )
    
    if File.symlink?( link )
      system "rm #{link}"
    end
  end
end

namespace :homebrew do
  desc 'Installs Homebrew'
  task :install do
    puts 'Installing Homebrew...'
    system 'ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"'
  end
  
  desc 'Installs several useful formulae'
  task :install_formulae do
    puts 'First, updating Homebrew...'
    system 'brew update'
    
    puts 'Upgrading existing formulae...'
    system 'brew upgrade'
    
    formulae.each do |formula|
      puts "Installing #{formula}..."
      system "brew install #{formula}"
    end
    
    puts 'Taking out the trash...'
    system 'brew cleanup'
  end
end

namespace :osx do
  task :config do
    
  end
end