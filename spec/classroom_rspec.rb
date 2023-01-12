require '../classroom'
require '../student'

describe Classroom do
  context 'When testing the classroom class' do
    it 'The label must contain: class b' do
      classrm = Classroom.new('class b')
      expect(classrm.label).to eq 'class b'
    end
  end

  context 'When testing the classroom class' do
    it ' The method add student must add one student and shows the name' do
      classroom = Classroom.new('class b')
      student = Student.new(50, 'Jhosep', parent_permission: true)
      classroom.add_student(student)
      expect(classroom.students[0].name).to eq 'Jhosep'
    end
  end
end
