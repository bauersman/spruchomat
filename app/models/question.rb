class Question < ActiveRecord::Base
  belongs_to :run
  belongs_to :poster
  belongs_to :answered_party, class_name: 'Party'

  scope :answered, -> { where(answered: true) }

  def correct_answer?
    answered? && poster.party_id == answered_party_id
  end
end
