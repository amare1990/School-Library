require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def menu
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def run
    puts 'Welcome to School Library App!\n'

    while(true)
      menu
      option = gets.chomp.to_i
      case option
      when 1
        list_books
      when 2
        list_people
      when 3
        create_people
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_rentals
      when 7
        break
      else
        puts 'Invalid menu option'
      end
    end
  end

  def list_books
    if @books.empty?
      puts 'Books not created yet'
    else
      @books.each {|book| puts "Title: #{book.title}, Author: #{book.author}"}
    end
  end

  def list_people
    if @people.empty?
      puts "People not created yet"
    else
      @people.each {|people| puts "[#{people.class}] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}"}
    end
  end

  def create_people
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.to_i
    if option == 1
      create_student
    elsif option == 2
      create_teacher
    else
      puts "Invalid choice"
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.to_s
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.downcase
    if permission == y
      permission = true
    elsif permission == n
      permission = false
    else
      puts 'Invalid permission input'
    end
    student = Student.new(age, name, permission)
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
    print "Title: "
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index {|book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}"}
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |people, index| puts "#{index}) [people.class] Name: #{people.name}, ID: #{people.id}, Age: #{people.age}" }
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

    @rentals.select { |rental| puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id }
  end
end
