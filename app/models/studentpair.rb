class Studentpair < ApplicationRecord
  def get_random_student
    Student.order("RANDOM()").limit(1).ids.join.to_i
  end
  def create_random_studentpair

  end
end
