class Student < ApplicationRecord
  belongs_to :batch
  has_many :evaluations, dependent: :destroy



  def average_score
    evaluations.average_score
  end
end
