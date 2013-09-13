class Party < ActiveRecord::Base
  has_many :posters

  validates :name, presence: true

  include FriendlyId
  friendly_id :display_name, use: :slugged

  def display_name
    short_name.present? ? short_name : name
  end

  def should_generate_new_friendly_id?
    super || slug.blank?
  end
end
