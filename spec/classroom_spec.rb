require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before(:all) do
    @classroom = Classroom.new('Biology')
  end

  describe '#classroom' do
    it 'should be an instance of class Classroom' do
      @classroom.should be_an_instance_of Classroom
    end

    it 'should return the label of the classroom' do
      expect(@classroom.label).to eql 'Biology'
    end
  end

  context 'should return number of students added to classroom' do
    it 'should return the count of a subject' do
      cs101 = Classroom.new('Computer Science')
      student1 = Student.new(18, 'Alice')
      student2 = Student.new(21, 'Bob')
      cs101.add_student(student1)
      cs101.add_student(student2)
      expect(cs101.students.count).to eq 2
    end
  end
end
