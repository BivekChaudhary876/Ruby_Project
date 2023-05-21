# Ruby Library Management System
# Create the class of book
class Book
  attr_accessor :title, :author, :available

  def initialize(title, author)
    @title = title
    @author = author
    @available = true
  end
end

# Create the class of Library
class Library
  attr_accessor :books

  #Initializations
  def initialize
    @books = []
  end

  # Method of Adding the books
  def add_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "The book '#{book.title}' by #{book.author} has been added to the library."
  end

  # Method of listing the book into the library
  def list_books
    if @books.empty?
      puts "No books available in the library."
    else
      puts "Listing all books in the library:"
      @books.each_with_index do |book, index|
        status = book.available ? "Available" : "Not Available"
        puts "#{index + 1}. #{book.title} by #{book.author} (#{status})"
      end
    end
  end

  # Method for borrowing the book if available
  def borrow_book(book_index)
    if @books.empty? || book_index < 1 || book_index > @books.length
      puts "Invalid book index."
    else
      book = @books[book_index - 1]
      if book.available
        book.available = false
        puts "You have borrowed the book '#{book.title}' by #{book.author}. Enjoy reading!"
      else
        puts "The book '#{book.title}' by #{book.author} is currently not available."
      end
    end
  end

  # Method for returning the book if borrowed
  def return_book(book_index)
    if @books.empty? || book_index < 1 || book_index > @books.length
      puts "Invalid book index."
    else
      book = @books[book_index - 1]
      if book.available
        puts "The book '#{book.title}' by #{book.author} is already available in the library."
      else
        book.available = true
        puts "You have returned the book '#{book.title}' by #{book.author}. Thank you!"
      end
    end
  end
end

# Create the object
library = Library.new

loop do
  puts "Welcome to the Ruby Library Management System!"
  puts "Please select an option:"
  puts "1. Add a book"
  puts "2. List all books"
  puts "3. Borrow a book"
  puts "4. Return a book"
  puts "5. Exit"

  option = gets.chomp().to_i
  # Implementing the case expression
  case option
  when 1
    puts "Enter the title of the book:"
    title = gets.chomp()

    puts "Enter the author of the book:"
    author = gets.chomp()

    library.add_book(title, author)
  when 2
    library.list_books
  when 3
    puts "Enter the index of the book you want to borrow:"
    book_index = gets.chomp().to_i

    library.borrow_book(book_index)
  when 4
    puts "Enter the index of the book you want to return:"
    book_index = gets.chomp().to_i

    library.return_book(book_index)
  when 5
    puts "Invalid option"
    break
  end

  puts "\n"
end
