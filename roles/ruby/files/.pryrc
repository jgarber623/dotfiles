Pry.config.history_file = "#{ENV['HOME']}/.irb_history"
Pry.config.prompt_name = File.basename(Dir.pwd)

def clear
  system('clear')
end
