require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  before(:all) do
    @person = Person.new(40, 'Stephen William Hawking')
    @decorator = TrimmerDecorator.new(@person)
  end

  describe '#decorator' do
    it 'should return name with a maximum of 10 characters' do
      expect(@decorator.correct_name.length).to eql 10
    end
  end
end
