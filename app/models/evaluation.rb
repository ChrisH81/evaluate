class Evaluation < ApplicationRecord
  belongs_to :student
  default_scope { order(date: :desc) }

  def self.average_score
    average(:score)
  end

end
