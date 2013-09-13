class Poster < ActiveRecord::Base
  belongs_to :party

  validates :text, presence: true
end
