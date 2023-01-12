require '../solver'

describe Solver do
  context 'When testing the Solver class' do
    it 'The factorial of 5 should be 120' do
      solver = Solver.new
      factorial = solver.factorial(5)
      expect(factorial).to eq 120
    end
  end
end
