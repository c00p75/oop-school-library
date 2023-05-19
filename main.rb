require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def option_list
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - List all rentals for a given person id'
    puts '4 - Create a person'
    puts '5 - Create a book'
    puts '6 - Create a rental'
    puts '7 - Exit'
  end

  def option(input)
    case input
    when '1'
      @app.list_books
    when '2'
      @app.list_people
    when '3'
      @app.list_rentals
    when '4'
      @app.create_person
    when '5'
      @app.create_book
    when '6'
      @app.create_rental

    else
      puts 'Please enter a number between 1 and 7'
    end
  end

  def main
    puts 'Welcome to School Library App!'

    loop do
      option_list
      input = gets.chomp
      if input == '7'
        puts 'Thanks for using the app!'
        break
      end
      option(input)
    end
  end
end

run_app = Main.new
run_app.main
