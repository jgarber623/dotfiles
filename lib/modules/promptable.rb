module Promptable
  def prompt(msg, code = 32)
    puts "\033[#{code}m#{msg}\033[0m"
  end
end
