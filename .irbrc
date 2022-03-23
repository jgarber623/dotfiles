require 'irb/completion'

IRB.conf[:AUTO_INDENT]      = true
IRB.conf[:HISTORY_FILE]     = "#{ENV['HOME']}/.irb_history"
IRB.conf[:SAVE_HISTORY]     = 1000
IRB.conf[:USE_AUTOCOMPLETE] = false

def clear
  system('clear')
end
