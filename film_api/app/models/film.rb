class Film < ActiveRecord::Base
  friendly_id :title, use: :slugged

end
