class Studentpair < ApplicationRecord

  def self.build_robin
    students = Student.all.ids
    students.push('x') if students.size.odd?
    n = students.size
    half_n = n / 2
    king = [students[0]]
    first_half1 = students[1..(half_n - 1)]
    second_half1 = students[half_n..-1].reverse
    students1 = king + first_half1
    students2 = second_half1
    date = Date.today
    i = 0

      while i < half_n do
        Studentpair.create!(student1: students1.shift, student2: students2.shift, date: date)
        i += 1
      end
  end

  def self.build_robin_next_day
    students = Student.all.ids
    students.push('x')  if students.size.odd?
    n = students.size
    half_n = n / 2
    king = [students[0]]
    first_half = students[1..(half_n - 1)]
    second_half = students[half_n..-1].reverse
    date = Date.today
    day = 0

    first_half_next = king + [second_half[0]] + (first_half - [first_half.last])
    second_half_next = (second_half - [second_half[0]]) + [first_half.last]

    students1 = first_half_next
    students2 = second_half_next
    date = date + 1.day

    while day < half_n do
      Studentpair.create!(student1: students1.shift, student2: students2.shift, date: date)
      day += 1
    end
  end

  def self.build_robin_rest_of_days
    students = Student.all.ids
    students.push('x')  if students.size.odd?
    n = students.size
    half_n = n / 2
    king = [students[0]]
    date = Date.today + 1.day
    all_days = 2

    while all_days < (n - 1) do
      first_half = Studentpair.all.where(date: date).pluck(:student1)
      second_half = Studentpair.all.where(date: date).pluck(:student2)
      first_half_next = king + [second_half[0]] + (first_half - [first_half[0]])
      second_half_next = (second_half - [second_half[0]]) + [first_half.last]
      date = date + 1.day
      day = 0

      while day < half_n do
        students1 = first_half_next
        students2 = second_half_next
        Studentpair.create!(student1: students1.shift, student2: students2.shift, date: date)
        day += 1
      end
    all_days += 1
    end
  end

  def self.steamup
    Studentpair.build_robin
    Studentpair.build_robin_next_day
    Studentpair.build_robin_rest_of_days
  end



  # def self.available_students_date(date)
  #   studentlist = Student.all.ids
  #   assigned_students1 = Studentpair.all.where(date: date).pluck(:student1)
  #   assigned_students2 = Studentpair.all.where(date: date).pluck(:student2)
  #
  #   available_students = studentlist - assigned_students1 - assigned_students2
  #   puts "$$$$$$$ >> The available students array: #{available_students}"
  #   return available_students
  # end
  #
  # def self.get_random_student(available_students)
  #   loop do
  #     @student = Student.order("RANDOM()").limit(1).ids.join.to_i
  #     break if available_students.include?(@student)
  #   end
  #
  #   return @student
  # end
  #
  # def self.create_random_studentpair(student1, pairs_date)
  #   loop do
  #     @student2 = get_random_student(Studentpair.available_students_date(pairs_date))
  #     break if student1 != @student2
  #   end
  #
  #   puts "#{student1} and #{@student2}"
  #   return @student2
  # end
  #
  # def self.validate_studentpair(student1, student2)
  #   studentpair = Studentpair
  #     .where("(student1 = ? AND student2 = ?) OR (student2 = ? AND student1 = ?)",
  #     student1, student2,
  #     student1, student2,
  #   )
  #
  #   studentpair == []
  # end
  #
  # def self.get_date
  #   # Date.today.strftime("%A")
  #   Date.today
  # end
  #
  # def self.set_date(date)
  #   date_input = Date.parse(date.to_s)
  #   date_input < get_date ? "The set date provided is before today" : date_input
  # end
  #
  # def self.store_student_pair(student1, student2, date)
  #   Studentpair.create!(student1: student1, student2: student2, date: date)
  # end
  #
  # def self.steamup(date)
  #   pairs_date = set_date(date)
  #   students_count = Student.count
  #   student1 = nil
  #
  #   while students_count > 1 && Studentpair.available_students_date(pairs_date) != []
  #     puts "Students count before pairing two students at random: #{students_count}"
  #
  #     x = available_students_date(pairs_date)
  #     get_random_student(x)
  #     student1 = @student
  #
  #     loop do
  #       create_random_studentpair(student1, pairs_date)
  #       studentpair_valid = validate_studentpair(student1, @student2) # Unsure
  #       break if studentpair_valid == true
  #     end
  #
  #     store_student_pair(student1, @student2, pairs_date)
  #
  #     puts "#{Studentpair.last}"
  #     students_count = students_count - 2
  #     puts "Student count after storing to database: #{students_count}"
  #   end
  # end
  #
  # def self.get_studentpair_day(student, date)
  #   date_input = Date.parse(date.to_s)
  #
  #   studentpair = Studentpair
  #     .where("(student1 = ? OR student2 = ?) AND date = ?", student, student, date)
  #
  #   student1 = studentpair[0]["student1"]
  #   student2 = studentpair[0]["student2"]
  #
  #   if student1 == student
  #     "Your pair for today (#{date_input}) is #{get_student_name(student2)}"
  #   else
  #     "Your pair for today (#{date_input}) is #{get_student_name(student1)}"
  #   end
  # end
  #
  # def self.get_student_name(student)
  #   student = Student.find(student)
  #   student.email
  # end
end
