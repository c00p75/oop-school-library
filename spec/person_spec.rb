require_relative '../person'

RSpec.describe Person do
  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      person = Person.new(20)
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns true if the person is underage but has parent permission' do
      person = Person.new(16, 'John', parent_permission: true)
      expect(person.can_use_services?).to eq(true)
    end

    it 'returns false if the person is underage and has no parent permission' do
      person = Person.new(16, 'John', parent_permission: false)
      expect(person.can_use_services?).to eq(false)
    end
  end

  describe '#add_rentals' do
    it 'adds a rental to the person' do
      person = Person.new(25, 'Jane')
      rental = double('rental')
      expect(rental).to receive(:person=).with(person)
      person.add_rentals(rental)
      expect(person.rentals).to include(rental)
    end
  end
end
