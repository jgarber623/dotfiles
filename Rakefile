require "rake"
require "erb"

def dotfiles
  Dir.glob( "*/**{.symlink}" )
end

def link_file( file, filename, target )
  if file =~ /.erb.symlink$/
    puts "Generating ~/.#{filename}"
    File.open( target, "w" ) do |new_file|
      new_file.write ERB.new( File.read( file ) ).result( binding )
    end
  else
    puts "Linking ~/.#{filename}"
    system %Q{ln -fs "$PWD/#{file}" "#{target}"}
  end
end

def replace_file( file, filename, target )
  system %Q{rm -rf "#{target}"}
  link_file( file, filename, target )
end

task :default => "install"

desc "Installs dotfiles symlinks into user's home directory."
task :install do
  dotfiles.each do |file|
    filename = file.split( "/" ).last.split( "." ).first
    target = "#{ENV["HOME"]}/.#{filename}"
    
    if File.exists?( target ) || File.symlink?( target )
      puts "~/.#{filename} already exists! Do you want to [o]verwrite or [s]kip this file?"
      
      case STDIN.gets.chomp
        when "o"
          replace_file( file, filename, target )
        else
          puts "Skipping ~/.#{filename}."
      end
    else
      link_file( file, filename, target )
    end
  end
  
  puts "Would you like to switch your shell to zsh?"
  case STDIN.gets.chomp
    when "y"
      system %Q{chsh -s /bin/zsh}
      
      puts "You're now using zsh! Be sure to restart your shell for the changes to take effect."
    else
      puts "Keeping your current shell."
    end
  end
end

desc "Removes dotfiles symlinks from user's home directory."
task :uninstall do
  dotfiles.each do |file|
    link = File.expand_path( "~/.#{file}" )
    if File.symlink?( link )
      system %Q{rm "#{link}"}
    end
  end
end