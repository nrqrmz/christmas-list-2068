require 'csv'

def ask_user_for(something)
  puts something
  print '> '
  gets.chomp
end

def ask_user_for_index
  puts 'Index?'
  print '> '
  gets.chomp.to_i - 1
end

def display_list_with_status(list)
  list.each_with_index do |gift, index|
    status = gift[:purchased] ? 'X' : ' '
    puts "#{index + 1} - [#{status}] #{gift[:name]}"
  end
end

def display_list(options)
  options.each_with_index do |option, index|
    puts "#{index + 1} - #{option}"
  end
end

def load_csv
  filepath = 'data/gifts.csv'

  gifts = []
  CSV.foreach(filepath, headers: :first_row) do |row|
    # TODO: build new gift from information stored in each row
    status = row['purchased'] == 'true'
    gifts << { name: row['name'], purchased: status }
  end

  gifts
end

def save_csv(list)
  filepath = 'data/gifts.csv'

  CSV.open(filepath, 'wb') do |csv|
    # add headers
    csv << %w[name purchased]

    # iterate on list and add every gift
    list.each do |gift|
      csv << [gift[:name], gift[:purchased]]
    end
  end
end
