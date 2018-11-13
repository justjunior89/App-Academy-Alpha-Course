
class RPNCalculator

  def initialize
    @array = []
  end
  def push(num)
    @array << num
  end

  def plus
    raise "calculator is empty" if @array.empty?
    second_n = @array.pop
    first_num = @array.pop
    @array << second_n + first_num
  end

  def minus
    raise "calculator is empty" if @array.empty?
    second_n = @array.pop
    first_num = @array.pop
    @array << first_num - second_n
  end

  def times
    raise "calculator is empty" if @array.empty?
    second_n = @array.pop
    first_num = @array.pop
    @array << first_num * second_n
  end

  def divide
    raise "calculator is empty" if @array.empty?
    second_n = @array.pop
    first_num = @array.pop
    @array << first_num.to_f / second_n.to_f
  end

  def tokens(string)
    operation_symbols = [:+,:/,:-,:*]
    argument_arr = string.split(" ")
    token_arr = argument_arr.map do |el|
      if operation_symbols.include?(el.to_sym)
        el = el.to_sym
      else
        el = el.to_i
      end
    end
    token_arr
  end

  def evaluate(string)
    tokens = tokens(string)
    tokens.each do |token|
      case token
        when Integer
          push(token)
        when Symbol
            if token == :+
              plus
            elsif token == :-
              minus
            elsif token == :*
              times
            elsif token == :/
              divide
            end
      end
    end
    value
  end

  def value
    @array.last
  end

end
