class Studentpair < ApplicationRecord

  def get_random_student
    Student.order("RANDOM()").limit(1).ids.join.to_i
  end

  def create_random_studentpair

  end

  def store_student_pair(student1, student2)
    Studentpair.new(student1: student1, student2: student2, date:)
  end
end
