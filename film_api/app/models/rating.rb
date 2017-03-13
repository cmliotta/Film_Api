class Rating < ActiveRecord::Base
  belongs_to :film

  validates :film_id, presence: true
  validates :score, presence: true, inclusion: 1..10
end
