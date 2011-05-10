require "rake"
require "erb"

desc "Install dot files into user's home directory."

task :install do
  files = Dir.glob( "*/**{.symlink}" )
  
  files.each do |file|
    filename = file.split( "/" ).last.split( "." ).first
    target = "#{ENV["HOME"]}/.#{filename}"
    
    if File.exists?( target ) || File.symlink?( target )
      if File.identical?( file, target )
        puts "#{filename} is identical to #{target}"
      else
        puts "~/.#{filename} already exists! Do you want to [o]verwrite or [s]kip this file?"
        
        case STDIN.gets.chomp
          when "o"
            replace_file( file, filename, target )
          else
            puts "Skipping ~/.#{filename}"
        end
      end
    else
      link_file( file, filename, target )
    end
  end
end

def replace_file( file, filename, target )
  # system %Q{rm -rf "#{target}"}
  link_file( file, filename, target )
end

def link_file( file, filename, target )
  if file =~ /.erb.symlink$/
    puts "Generating ~/.#{filename}"
    # File.open( target, "w" ) do |new_file|
    #   new_file.write ERB.new( File.read( file ) ).result( binding )
    # end
  else
    puts "Linking ~/.#{filename}"
    # system %Q{ln -fs "$PWD/#{file}" "#{target}"}
  end
end