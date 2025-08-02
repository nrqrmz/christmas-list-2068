# TODO# Pseudo-code:
# PARSING
# 1. Create a helper to read the csv file
# STORING
# 2. Create a method to write in the csv file

require_relative 'christmas_helpers'
require_relative 'scraper'

gift_list = load_csv # in-memory

puts 'Welcome to your Christmas gift list'

loop do
  puts 'Which action [list|add|idea|mark|delete|quit]?'
  user_action = gets.chomp

  case user_action
  when 'list'
    display_list_with_status(gift_list)
  when 'add'
    gift_name = ask_user_for('What gift would you like to add?')
    gift = { name: gift_name, purchased: false }
    gift_list << gift
    display_list_with_status(gift_list)
    save_csv(gift_list) # persist to csv file (db)
  when 'idea'
    gift_idea = ask_user_for('What are you looking for?')
    options = scraper(gift_idea)
    display_list(options)
    gift_index = ask_user_for_index
    gift_name = options[gift_index]
    gift = { name: gift_name, purchased: false }
    gift_list << gift
    display_list_with_status(gift_list)
    save_csv(gift_list)
  when 'mark'
    display_list_with_status(gift_list)
    gift_index = ask_user_for_index
    gift_list[gift_index][:purchased] = true
    display_list_with_status(gift_list)
    save_csv(gift_list)
  when 'delete'
    display_list_with_status(gift_list)
    gift_index = ask_user_for_index
    gift_list.delete_at(gift_index)
    display_list_with_status(gift_list)
    save_csv(gift_list)
  when 'quit' then break
  else
    puts 'Choose a valid option'
  end
end

puts 'Goodbye'
