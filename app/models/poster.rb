class Poster < ActiveRecord::Base
  belongs_to :party

  validates :text, presence: true

  mount_uploader :url, ::PosterUploader
end
