class Rental
  attr_accessor :date, :person, :book

  def initialize(date, book, person)
    @date = date
    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
