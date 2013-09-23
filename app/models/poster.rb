class Poster < ActiveRecord::Base
  belongs_to :party
  has_many :questions

  validates :text, presence: true

  mount_uploader :url, ::PosterUploader
end
