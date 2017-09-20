class Studentpair < ApplicationRecord

  def self.available_students_date(date)
    studentlist = Student.all.ids
    assigned_students1 = Studentpair.all.where(date: date).pluck(:student1)
    assigned_students2 = Studentpair.all.where(date: date).pluck(:student2)

    available_students = studentlist - assigned_students1 - assigned_students2
    puts "$$$$$$$ >> The available students array: #{available_students}"
    return available_students
  end

  def self.get_random_student(available_students)
    loop do
      @student = Student.order("RANDOM()").limit(1).ids.join.to_i
      break if available_students.include?(@student)
    end

    return @student
  end

  def self.create_random_studentpair(student1, date)
    loop do
      @student2 = get_random_student(Studentpair.available_students_date(date))
      break if student1 != @student2
    end

    puts "#{student1} and #{@student2}"
    return @student2
  end

  def self.validate_studentpair(student1, student2)
    studentpair = Studentpair
      .where("(student1 = ? AND student2 = ?) OR (student2 = ? AND student1 = ?)",
      student1, student2,
      student1, student2,
    )

    studentpair == []
  end

  def self.get_date
    # Date.today.strftime("%A")
    Date.today
  end

  def self.set_date(date)
    date_input = Date.parse(date.to_s)
    date_input < get_date ? "The set date provided is before today" : date_input
  end

  def self.store_student_pair(student1, student2, date)
    Studentpair.create!(student1: student1, student2: student2, date: date)
  end

  def self.steamup(date)
    pairs_date = set_date(date)
    students_count = Student.count
    student1 = nil

    while students_count > 1 && Studentpair.available_students_date(pairs_date) != []
      puts "Students count before pairing two students at random: #{students_count}"

      x = available_students_date(pairs_date)
      get_random_student(x)
      student1 = @student

      loop do
        create_random_studentpair(student1, pairs_date)
        studentpair_valid = validate_studentpair(student1, @student2) # Unsure
        break if studentpair_valid == true
      end

      store_student_pair(student1, @student2, pairs_date)

      puts "#{Studentpair.last}"
      students_count = students_count - 2
      puts "Student count after storing to database: #{students_count}"
    end
  end

  def self.get_studentpair_day(student, date)
    date_input = Date.parse(date.to_s)

    studentpair = Studentpair
      .where("(student1 = ? OR student2 = ?) AND date = ?", student, student, date)

    student1 = studentpair[0]["student1"]
    student2 = studentpair[0]["student2"]

    if student1 == student
      "Your pair for today (#{date_input}) is #{get_student_name(student2)}"
    else
      "Your pair for today (#{date_input}) is #{get_student_name(student1)}"
    end
  end

  def self.get_student_name(student)
    student = Student.find(student)
    student.email
  end
end
