class Studentpair < ApplicationRecord
  def get_random_student
    Student.order("RANDOM()").limit(1).map{ |student| student.send(:id) }


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
end
