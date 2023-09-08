require_relative 'person'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'students'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
p book = Book.new('Title', 'Author')
p person = Person.new(25, 'John Doe')

# Create a rental and associate it with the book and person
p Rental.new(book, person)

# Creating a person

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name

# Creating unique instances of books
book1 = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
book2 = Book.new('The Lord of the Rings', 'J.R.R. Tolkien')
