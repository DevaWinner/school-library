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

end