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
end
