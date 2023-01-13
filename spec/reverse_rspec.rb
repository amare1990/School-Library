require '../solver'

describe Solver do
  context 'When testing the Solver class' do
    it 'The reverse of hello should be olleh' do
      solver = Solver.new
      reversed_word = solver.reverse('hello')
      expect(reversed_word).to eq 'olleh'
    end
  end
end
