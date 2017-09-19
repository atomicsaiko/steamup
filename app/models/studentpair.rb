class Studentpair < ApplicationRecord

  def available_students
    studentlist = Student.all.ids
    assigned_students1 = Studentpair.all.pluck(:student1)
    assigned_students2 = Studentpair.all.pluck(:student2)

    @available_students = studentlist - assigned_students1 - assigned_students2
  end

  def get_random_student(@available_students)
    student = nil

    loop do
      student = Student.order("RANDOM()").limit(1).ids.join.to_i
      break if @available_students.include?(student)
    end
    return student
  end

  def create_random_studentpair
  end

  def self.validate_studentpair(student1, student2)
    studentpair = Studentpair
      .where("student1 = ? AND student2 = ?", student1, student2)

    studentpair != []
  end

  def get_date
    # Date.today.strftime("%A")
    Date.today
  end

  def set_date(date)
    date_input = Date.parse(date.to_s)
    date_input < get_date ? "The set date provided is before today" : date_input
  end

  def self.store_student_pair(student1, student2, date)
    Studentpair.create!(student1: student1, student2: student2, date: date)
  end
end
