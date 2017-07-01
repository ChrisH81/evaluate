class Batch < ApplicationRecord
  has_many :students, dependent: :destroy
  default_scope { order(start_date: :asc) }

  # Algorithm for random student
  def self.random_student
    if no_evaluations?
      pick_student_no_score
    else
      pick_student_with score
    end
  end

  #if no evaluations still need to review this
  def self.no_evaluations?
    Student.batch.any? { |student| student.evaluations.blank? }
  end

  #if no score
  def self.pick_student_no_score
    students_no_score = Student.batch.select do |student|
    student.average_score == nil
    end
      students_no_score.sample
  end

  # Pick a student within current batch
  def self.pick_student_with_score
    # scores = [1, 2, 3]
    @students = Student.where(batch_id)
  end

  # select from that batch of students according to rating
  def select_student
    picked = rand(0..1)

    case student_color
      when picked <= 0.17
        chosen = students.where(score: 3).order('RANDOM()').first

      when picked > 0.17 && picked <= 0.50
        chosen = students.select{|key| key[:score] == 2}
        result = chosen[rand(chosen.length)]

      else
        chosen = students.select{|key| key[:score] == 1}
        result = chosen[rand(chosen.length)]
    end
  end



end
