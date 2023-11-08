Pry.config.history_file = "#{ENV['HOME']}/.irb_history"
Pry.config.pager        = false

Pry::Commands.block_command 'clear', 'Clear the terminal screen' do
  system('clear')
end
