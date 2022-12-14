require_relative './app'

def display_home_choices
  choices = [
    'List all books', 'List all people', 'Create a person', 'Create a book',
    'Create a rental', 'List all rentals for a given person id', 'Exit'
  ]
  puts "\n\nPlease choose an action by entering the option number."
  choices.each_with_index { |choice, index| puts "#{index + 1} - #{choice}" }
  print 'Choice: '
end

def choices_map(app)
  {

    '1' => -> { app.list_all_books },
    '2' => -> { app.list_all_people },
    '3' => -> { app.create_person },
    '4' => -> { app.create_book },
    '5' => -> { app.create_rental },
    '6' => -> { app.rental_by_id },
    '7' => lambda {
             puts "\nThank you for using this app. Bye!"
             exit
           }
  }
end

def main
  puts "\nWelcome to School Library App!\n"
  display_home_choices

  app = App.new
  app.create_classrooms('Class1') # Create some classroom

  trials = 0
  loop do
    choice = gets.chomp
    choices = choices_map(app)
    if choices[choice].nil?
      trials += 1
      puts "You've entered an invalid character#{trials > 2 ? ' three times. Bye' : ''}!"
      print 'Choice: '
    else
      choices[choice].call
      display_home_choices
    end
    break if trials > 2
  end
end

main
