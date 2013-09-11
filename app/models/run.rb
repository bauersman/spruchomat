# encoding: utf-8
#
class Run < ActiveRecord::Base
  belongs_to :session

  serialize :data, HashWithIndifferentAccess

  before_create :setup_data

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
