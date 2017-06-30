class Student < ApplicationRecord
  belongs_to :batch
  has_many :evaluations, dependent: :destroy

  def average_score
    evaluations.average_score
  end

  # Algorithm for random student
  def self.random_student
    if no_evaluations?
      pick_student_no_score
    else
      pick_student_with score
    end
  end

  def self.pick_student_with_score
    scores = [1, 2, 3]
    @students = Student.where(batch_id: batch_nr) # select all student with a batch id equal to the requested batch_nr
  end
    # select from that batch of students according to rating
  def select_students_by_color
    number = rand(1..100)
    if number <= 50
      elem = evaluations.select{|key| key[:score] == 1}
      result = elem[rand(elem.length)]
      puts result
    elsif number > 50 && number <= 83
      elem = evaluations.select{|key| key[:score] == 2}
      result = elem[rand(elem.length)]
      puts result
    else
      elem = evaluations.select{|key| key[:score] == 3}
      result = elem[rand(elem.length)]
      puts result
    end
  end

  def self.pick_student_no_score
    students_no_score = Student.batch.select do |student|
    student.average_score == nil
  end
    students_no_score.sample
  end
end
