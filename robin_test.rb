def Academy(students)

  students = []

  @days = {}

  students.push(nil) if students.size.odd?
  days = students.size - 1
  paires_per_day = students.size / 2
  days.times do |index|
    @days[index+1] = []
    paires_per_day.times do |pair_index|
      @days[index+1] << [students[pair_index], students.reverse[pair_index]]
    end
    students = [students[0]] + students[1..-1].rotate(-1)
  end

end

module RoundRobinStudents

  def self.full_circulation
    students = Students.all.ids
    students.push(nil) if students.size.odd?
    n = students.size
    pivot = students.pop
    pairs = (n - 1).times.map do       
      students.rotate!
      [[students.first, pivot]] + (1...(n / 2)).map { |j| [students[j], array[n - 1 - j]] }
    end
    students.push(pivot) unless pivot.nil?
    pairs
  end

end
