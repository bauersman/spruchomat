# encoding: utf-8
#
class Run < ActiveRecord::Base
  belongs_to :session

  serialize :data, HashWithIndifferentAccess

  before_create :setup_data
  before_create :generate_extid

  include FriendlyId
  friendly_id :extid

  def questions
    data[:questions]
  end

  def answers
    data[:answers]
  end

  def current_question
    data[:questions][data[:answers].count]
  end

  def finished?
    data[:answers].count >= data[:questions].count
  end

  def progress_percent
    answers.count * 100 / questions.count
  end

  private

  def generate_extid
    done = false
    while not done
      generated_id = SecureRandom.urlsafe_base64(6)
      next if ::Run.exists?(extid: generated_id)
      done = true
    end
    self.extid = generated_id
  end

  def setup_data
    data[:questions] = generate_questions
    data[:answers] = []
  end

  def generate_questions
    [
      "Wer hat an der Uhr gedreht?",
      "Spitzensteuersatz für Geringverdiener!"
    ]
  end

end
