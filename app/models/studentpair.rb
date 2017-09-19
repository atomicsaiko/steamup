class Studentpair < ApplicationRecord
  def get_random_student
    Student.order("RANDOM()").limit(1).map(&:id)
  end
end
