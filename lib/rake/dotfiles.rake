require 'modules/promptable'

namespace :dotfiles do
  include Promptable

  desc "Install dotfile symlinks into #{Dir.home}"
  task :install do
    Dir.chdir(File.join(Dir.pwd, 'home')) do
      file_paths = Dir.glob(File.join('**/*.symlink'))

      file_paths.each do |file_path|
        linked_file_name = File.join(Dir.home, ".#{file_path.sub(/\.symlink$/, '')}")

        if File.exist?(linked_file_name)
          prompt "#{linked_file_name} already exists! Overwrite this file? [Yn]"

          next prompt("Skipping #{linked_file_name}...", 37) unless $stdin.gets.chomp == 'Y'

          prompt "Removing #{linked_file_name}..."

          FileUtils.rm_rf linked_file_name
        end

        prompt "Symlinking #{linked_file_name}..."

        FileUtils.mkdir_p File.dirname(linked_file_name)
        FileUtils.ln_sf File.join(Dir.pwd, file_path), linked_file_name
      end
    end
  end

  desc "Removes dotfile symlinks from #{Dir.home}"
  task :uninstall do
    prompt "Are you sure you want to remove symlinks from #{Dir.home}? [Yn]"

    return prompt('Skipping symlink removal...', 37) unless $stdin.gets.chomp == 'Y'

    prompt "Removing symlinks from #{Dir.home}..."

    Dir.chdir(File.join(Dir.pwd, 'home')) do
      file_paths = Dir.glob(File.join('**', '*.symlink'))

      file_paths.each do |file_path|
        linked_file_name = File.join(Dir.home, ".#{file_path.sub(/\.symlink$/, '')}")

        FileUtils.rm(linked_file_name) if File.symlink?(linked_file_name)
      end
    end
  end
end

task dotfiles: 'dotfiles:install'
