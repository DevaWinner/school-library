require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'teacher'
require_relative 'students'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def book_list
    puts 'List of all books'
    @books.each do |book|
      puts "Title: \"#{book.title}\" , Author: #{book.author}"
    end
  end

  def people_list
    puts 'List of all people'
    @people.each do |person|
      puts person
    end
  end

  def create_student(age, name, parent_permission)
    student = Student.new(age, name, parent_permission)
    @people << student
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, name, specialization)
    @people << teacher
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
  end

  def create_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals << rental
  end

  def books_for_rent
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\" , Author: #{book.author}"
    end
  end

  def all_renters
    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "#{index}) [Unknown Person] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def rented_book(selection_id)
    return @books[selection_id].id unless selection_id.negative? || selection_id > @books.length

    puts 'Invalid Selection. Please choose a valid index'
  end

  def renter_person(selection_id)
    return @people[selection_id].id unless selection_id.negative? || selection_id > @people.length

    puts 'Invalid Selection. Please choose a valid index'
  end

  def view_book_by_renters(id)
    rented_books_by_id = @rentals.select { |rental| rental.person == id.to_i }

    if rented_books_by_id.empty?
      puts 'No rentals found for this id'
    else
      rented_books_by_id.each do |rental|
        book = @books.find { |item| item.id == rental.book }
        puts "Date: #{rental.date} ,Title: #{book.title} by #{book.author}"
      end
    end
  end

end