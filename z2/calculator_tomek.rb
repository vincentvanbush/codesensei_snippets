class Calculator
  attr_reader :result
  attr_reader :name
  attr_reader :history

  def initialize(name)
    @name = name
    @result = 0
    @history = []
  end

  def add(val)
    @result += val
    @history << { operation: :add, value: val, result: @result }
  end

  def substract(val)
    @result -= val
    # @history[:substract] = @result
    @history << { operation: :subtract, value: val, result: @result }
  end

  def multiply(val)
    @result *= val
    @history << { operation: :multiply, value: val, result: @result }
  end

  def divide(val)
    @result /= val
    @history << { operation: :divide, value: val, result: @result }
  end

  def change_sign
    @result *= -1
    @history << { operation: :change_sign, result: @result }
  end

  def clear
    @result = 0
    @history << { operation: :clear, result: @result }
  end

  def print_history
    puts(@history.map { |elem| "#{elem[:operation]} #{elem[:value]} (result: #{elem[:result]})" })
  end
end

calc = Calculator.new('CASIO')
puts calc.name
calc.add(2)
calc.add(3)
puts calc.result
calc.add(10)
puts calc.result
calc.clear
puts calc.result
calc.substract(20)
puts calc.result
calc.multiply(3)
puts calc.result
calc.divide(4)
puts calc.result
calc.change_sign
puts calc.result
calc.print_history
