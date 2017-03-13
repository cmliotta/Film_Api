class Film < ActiveRecord::Base
  include FriendlyId

  friendly_id :title, use: :slugged

  has_many :ratings

  scope :by_title, -> (value) { where('(title like ?)', "%#{value}%") }

  def average_rating
    ratings.sum(:score).to_f / ratings.count
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
