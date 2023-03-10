require '../solver'

describe Solver do
  context 'When testing the Solver class' do
    it 'The factorial of 5 should be 120' do
      solver = Solver.new
      factorial = solver.factorial(5)
      expect(factorial).to eq 120
    end
  end

  context 'When testing the Solver class' do
    it 'The factorial of 0 should be 1' do
      solver = Solver.new
      factorial = solver.factorial(0)
      expect(factorial).to eq 1
    end
  end

  context 'When testing the Solver class' do
    it 'raises an exception when given a negative value' do
      solver = Solver.new
      expect { solver.factorial(-1) }.to raise_error('Factorial of a negative number is not applicable')
    end
  end
end
