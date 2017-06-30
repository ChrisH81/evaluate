class Batch < ApplicationRecord
  has_many :students, dependent: :destroy
  default_scope { order(start_date: :asc) }

end
