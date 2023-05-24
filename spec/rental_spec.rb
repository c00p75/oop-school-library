require_relative '../rental'
require_relative '../person'
require_relative '../book'

describe Rental do
  it 'should have coorect attribute properties' do
    date = '24/5/23'
    book = Book.new('Qwerty', 'Neil')
    person = Person.new(20, 'Steve')
    rental = Rental.new(date, person, book)
    expect(rental.person.name).to eql('Steve')
    expect(rental.person.age).to eql(20)
    expect(rental.book.title).to eql('Qwerty')
    expect(rental.book.author).to eql('Neil')
  end
end
