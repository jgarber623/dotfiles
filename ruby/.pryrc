# frozen_string_literal: true

Pry.config.history_file = "~/.irb_history"
Pry.config.pager = false

Pry::Commands.block_command "clear", "Clear the terminal screen" do
  system("clear")
end
