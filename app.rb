require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require 'json'

class App
  DATA_DIR = 'data'.freeze

  def initialize
    @all_books = []
    @all_people = []
    @all_rentals = []
  end

  def list_books
    puts
    puts '1) List all books'
    puts 'No books have been added.' if @all_books.empty?
    @all_books.each { |book| puts "[Book] Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_people
    puts
    puts '2) List all people'
    puts 'No people have been added.' if @all_people.empty?
    @all_people.each do |person|
      puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def list_rentals
    puts
    puts '3) List all rentals'
    return puts 'No rentals have been added.' if @all_rentals.empty?

    print 'Enter person ID: '
    id = gets.chomp.to_i

    puts 'Rented Books: '

    @all_rentals.each do |rental|
      if rental.person.id == id
        puts "Person: #{rental.person.name} Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts "Person ID: #{id} has no current rentals"
      end
    end
  end

  def create_student
    puts
    puts 'Create new student'

    print 'Enter student age [int]: '
    age = gets.chomp.to_i

    print 'Enter student name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'y'
      student = Student.new(age, name, parent_permission: true)
    when 'n'
      student = Student.new(age, name, parent_permission: false)
    end

    @all_people << student
    puts 'Student created successfully.'
  end

  def create_teacher
    puts
    puts 'Create new teacher'

    print 'Enter teacher age [int]: '
    age = gets.chomp.to_i

    print 'Enter teacher specialization: '
    specialization = gets.chomp

    print 'Enter teacher name: '
    name = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @all_people << teacher
    puts 'Teacher created successfully.'
  end

  def create_person
    puts
    puts '4) Create a person'
    print 'press 1 to create a student, press 2 to create a teacher: '
    choice = gets.chomp

    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. Try again.'
    end
  end

  def add_student(name, age)
    Student.new(name, age)
  end

  def create_book
    puts
    puts '5) Create new book'

    print 'Enter title: '
    title = gets.chomp

    print 'Enter author: '
    author = gets.chomp

    book = Book.new(title, author)
    @all_books << book
    puts "Book #{title} created successfully."
  end

  def create_rental
    puts
    puts '6) Create new rental'

    puts 'select a book from the follwing list by index number.'

    @all_books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by index number (not ID).'
    return puts 'No people have been added.' if @all_people.empty?

    permited_people = @all_people.select(&:can_use_services?)
    permited_people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i
    return puts 'Invalid input' unless (0...permited_people.length).include?(person_index)

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, permited_people[person_index], @all_books[book_index])
    @all_rentals << rental

    puts 'Rental created successfully'
  end

  def save_data_to_json
    Dir.mkdir(DATA_DIR) unless Dir.exist?(DATA_DIR)

    save_books_to_json
    save_people_to_json
    save_rentals_to_json

    puts 'Data saved successfully.'
  end

  def save_books_to_json
    books_data = @all_books.map { |book| { 'title' => book.title, 'author' => book.author } }
    File.open("#{DATA_DIR}/books.json", 'w') do |file|
      file.write(JSON.pretty_generate(books_data))
    end
  end  

  def save_people_to_json
    people_data = @all_people.map do |person|
      {
        'type' => person.class.name,
        'id' => person.id, # Include the person ID
        'age' => person.age,
        'name' => person.name,
        'parent_permission' => person.is_a?(Student) ? person.parent_permission : nil,
        'specialization' => person.is_a?(Teacher) ? person.specialization : nil
      }
    end
  
    File.open("#{DATA_DIR}/people.json", 'w') do |file|
      file.write(JSON.pretty_generate(people_data))
    end
  end

  def save_rentals_to_json
    rentals_data = @all_rentals.map do |rental|
      {
        'date' => rental.date,
        'person' => { 'id' => rental.person.id }, # Include the person ID
        'book' => { 'title' => rental.book.title } # Include the book title
      }
    end
  
    File.open("#{DATA_DIR}/rentals.json", 'w') do |file|
      file.write(JSON.pretty_generate(rentals_data))
    end
  end  

  def load_data_from_json
    load_books_from_json
    load_people_from_json
    load_rentals_from_json

    puts 'Data loaded successfully.'
  end

  def load_books_from_json
    if File.exist?("#{DATA_DIR}/books.json")
      books_json = File.read("#{DATA_DIR}/books.json")
      books_data = JSON.parse(books_json)
      @all_books = books_data.map { |book_data| Book.new(book_data['title'], book_data['author']) }
    end
  end  

  def load_people_from_json
    if File.exist?("#{DATA_DIR}/people.json")
      people_json = File.read("#{DATA_DIR}/people.json")
      people_data = JSON.parse(people_json)
  
      people_data.each do |person_data|
        if person_data['type'] == 'Student'
          student = Student.new(person_data['age'], person_data['name'], parent_permission: person_data['parent_permission'])
          student.id = person_data['id'] # Assign the person ID
          @all_people << student
        elsif person_data['type'] == 'Teacher'
          teacher = Teacher.new(person_data['age'], person_data['specialization'], person_data['name'])
          teacher.id = person_data['id'] # Assign the person ID
          @all_people << teacher
        end
      end
    end
  end  

  def load_rentals_from_json
    if File.exist?("#{DATA_DIR}/rentals.json")
      rentals_json = File.read("#{DATA_DIR}/rentals.json")
      rentals_data = JSON.parse(rentals_json)
  
      rentals_data.each do |rental_data|
        person_id = rental_data['person']['id']
        book_title = rental_data['book']['title']
  
        person = @all_people.find { |person| person.id == person_id }
        book = @all_books.find { |book| book.title == book_title }
  
        if person && book
          rental = Rental.new(rental_data['date'], person, book)
          @all_rentals << rental
        end
      end
    end
  end  
  
end
