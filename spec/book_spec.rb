require_relative '../book'

RSpec.describe Book do
  describe '#add_rentals' do
    it 'adds a rental to the book' do
      book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      rental = double('rental')
      expect(rental).to receive(:book=).with(book)
      book.add_rentals(rental)
      expect(book.rentals).to include(rental)
    end
  end
end
