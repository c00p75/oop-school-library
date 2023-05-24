require_relative '../teacher'

describe Teacher do
  before(:all) do
    @teacher = Teacher.new(50, 'Computer Science', 'Albert')
  end

  describe '#teacher' do
    it 'should be an instance of class Teacher' do
      @teacher.should be_an_instance_of Teacher
    end

    it 'should have desired attributes' do
      expect(@teacher).to have_attributes(age: 50, specialization: 'Computer Science', name: 'Albert')
    end

    it 'Teacer can use services' do
      expect(@teacher.can_use_services?).to be(true)
    end
  end
end
