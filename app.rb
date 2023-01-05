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
