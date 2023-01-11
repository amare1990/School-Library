require './student'
require './teacher'
require './book'
require './rental'
require 'json'

class App
  MENU = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_people,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals,
    7 => :exit
  }.freeze

  def initialize
    @books = read_books
    @people = read_people
    @rentals = []
  end

  def run
    puts 'Welcome to School Library App!\n'

    loop do
      puts ''
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'

      option = gets.chomp.to_i

      menu_item = MENU[option]
      if menu_item == :exit
        puts 'Thank you for using this App!'
        break
      elsif menu_item
        send(menu_item)
      else
        puts 'Invalid menu option'
      end
    end
  end

  def list_books
    if @books.empty?
      puts 'Books not created yet'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts 'People not created yet'
    else
      @people.each { |people| puts "[#{people.class}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}" }
    end
  end

  def create_people
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.to_i
    case option
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid choice'
    end
  end

  def save_people
    File.open('person.json', 'w') do |file|
      people = @people.each_with_index.map do |person, index|
        {
          class: person.class, Name: person.name, ID: person.id, Age: person.age,
          parent_permission: person.parent_permission,
          specialization: (person.specialization if person.instance_of?(Teacher)),
          index: index, id: person.id }
      end
      file.write(JSON.generate(people))
    end
  end

  def save_books
    File.open('books.json', 'w') do |file|
      books = @books.each_with_index.map do |book, index|
        {
          title: book.title, author: book.author, index: index
        }
      end
      file.write(JSON.generate(books))
    end
  end

  def save_rentals
    File.open('rentals.json', 'w') do |file|
      rentals = @rentals.each_with_index.map do |rental, _index|
        {
          date: rental.date, book_index: @books.index(rental.book),
          person_index: @people.index(rental.person)
        }
      end

      file.write(JSON.generate(rentals))
    end
  end

  def preserve_all
    save_people
    save_books
    save_rentals
  end

  def read_people
    return [] unless File.exist?('person.json')
    file_handle = File.read('person.json')
    json_people = JSON.parse(file_handle)
    json_people.map do |person|
      case person['class']
      when 'Teacher'
        Teacher.new(person['specialization'], person['Age'], person['Name'])
      when 'Student'
        Student.new(person['Age'], person['Name'], parent_permission: person['parent_permission'])
      end
    end
  end

  def read_books
    return [] unless File.exist?('books.json')
    json_books = JSON.parse(File.read('books.json'))
    json_books.map do |book|
      Book.new(book['title'], book['author'])
    end
  end

  def read_rentals
    return [] unless File.exist?('rentals.json')

    file_handle = File.read('rentals.json')
    object_rentals = JSON.parse(file_handle)

    object_rentals.map do |rental|
      Rental.new(rental['date'], @books[rental['book_index']], @people[rental['person_index']])
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'y'
      parent_permission = true
    when 'n'
      parent_permission = false
    else
      puts 'Invalid permission input'
    end
    student = Student.new(age, name, parent_permission: parent_permission)
    @people.push(student)
    puts 'Person Created successfully'

  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Specialization: '
    specialization = gets.chomp.to_s

    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |people, index|
      puts "#{index}) [people.class] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"
    end
    people_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_index], @people[people_index])
    @rentals << rental unless @rentals.include?(rental)
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals: '

    @rentals.select do |rental|
      puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.person.name}" if rental.person.id == person_id
    end
  end
end
