require_relative '../capitalize_decorator'

RSpec.describe CapitalizeDecorator do
  describe '#correct_name' do
    it 'capitalizes the correct name from the nameable object' do
      nameable = double('nameable', correct_name: 'john doe')
      decorator = CapitalizeDecorator.new(nameable)
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end
