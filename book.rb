class Book
  attr_accessor :title, :author, :rentals
  def initialize(title, author)
    @title, @author, @rentals = title, author, []
  end
end