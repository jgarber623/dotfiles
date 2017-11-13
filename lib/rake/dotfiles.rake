require 'modules/linkable'
require 'modules/promptable'

namespace :dotfiles do
  include Linkable
  include Promptable

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

task dotfiles: 'dotfiles:install'
