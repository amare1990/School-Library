require '../solver'

describe Solver do

  before(:all) do
    @solver = Solver.new
  end

  context 'When testing the Solver class' do
    it 'Should return fizz when n is 3' do

      expect(@solver.fizzbuzz(3)).to eq "fizz"
    end
  end

  context 'When testing the Solver class' do
    it 'Should return buzz when n is 5' do

      expect(@solver.fizzbuzz(5)).to eq "buzz"
    end
  end

  context 'When testing the Solver class' do
    it 'Should return fizzbuzz when n is 15' do

      expect(@solver.fizzbuzz(15)).to eq "fizzbuzz"
    end
  end

  context 'When testing the Solver class' do
    it 'Should return 7 when n is 7' do

      expect(@solver.fizzbuzz(7)).to eq "7"
    end
  end

end
