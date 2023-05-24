require_relative '../decorator'

RSpec.describe Decorator do
  describe '#correct_name' do
    it 'returns the correct name from the nameable object' do
      nameable = double('nameable', correct_name: 'john doe')
      decorator = Decorator.new(nameable)
      expect(decorator.correct_name).to eq('john doe')
    end
  end
end
