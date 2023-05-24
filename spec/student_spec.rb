require_relative '../student'

RSpec.describe Student do
  describe '#classroom=' do
    it 'assigns a classroom to the student and updates the classroom\'s students array' do
      student = Student.new(18, 'Alice')
      classroom = double('classroom', students: [])
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
      expect(classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'returns a string indicating playing hooky' do
      student = Student.new(16, 'Bob')
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
