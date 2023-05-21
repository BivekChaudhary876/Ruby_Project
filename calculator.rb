# Ruby Calculator
#Method Declaration
def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def multiply(num1, num2)
  num1 * num2
end

def divide(num1, num2)
  num1 / num2
end

loop do
  puts "Please enter the first number:"
  num1 = gets.chomp().to_f

  puts "Please enter the second number:"
  num2 = gets.chomp().to_f

  puts "Please select an operation:"
  puts "1. Addition"
  puts "2. Subtraction"
  puts "3. Multiplication"
  puts "4. Division"
  puts "5. Exit"

  operation = gets.chomp().to_i

  case operation
  when 1
    result = add(num1, num2)
    puts "The result of addition is: #{result}"
  when 2
    result = subtract(num1, num2)
    puts "The result of subtraction is: #{result}"
  when 3
    result = multiply(num1, num2)
    puts "The result of multiplication is: #{result}"
  when 4
    if num2.zero?
      puts "Error: Division by zero is not allowed."
    else
      result = divide(num1, num2)
      puts "The result of division is: #{result}"
    end
  when 5
    puts "Invalid operation."
  end

  puts "\n"
end
