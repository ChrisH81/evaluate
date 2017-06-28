class Evaluation < ApplicationRecord
  belongs_to :student
  
  default_scope { order(date: :desc) }
end
