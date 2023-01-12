class Solver

  def factorial(num)
    if num < 0
      raise "Factorial of a negative number is not applicable"
    end

    if num == 0
      return 1
    end

    return num * factorial(num - 1)

  end

  def reverse(word)
    word = word.reverse
  end

  def fizzbuzz(n)
    if n % 3 == 0 && n % 5 == 0
      return "fizzbuzz"
    elsif n % 3 == 0
      return "fizz"
    elsif n % 5 == 0
      return "buzz"
    else
      return n.to_s
    end
  end



end



