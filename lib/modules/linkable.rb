require 'modules/promptable'

module Linkable
  include Promptable

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
end
