# encoding: utf-8
#
class Run < ActiveRecord::Base
  belongs_to :session

  serialize :data, HashWithIndifferentAccess

  before_create :setup_data
  before_create :generate_extid

  include FriendlyId
  friendly_id :extid

  def poster_ids
    data[:poster_ids]
  end

  def answer_ids
    data[:answer_ids]
  end

  def answer!(party_id)
    data[:answer_ids] << party_id
    save!
  end

  def correct_answers_count
    count = 0
    poster_ids.map{|id| Poster.find(id).party.slug}.each_with_index do |correct_slug, idx|
      count += 1 if answer_ids[idx] == correct_slug
    end
    count
  end

  def current_poster
    Poster.find(poster_ids[answer_ids.count])
  end

  def finished?
    answer_ids.count >= poster_ids.count
  end

  def progress_numbers
    "#{answer_ids.count}/#{poster_ids.count}"
  end

  def progress_percent
    answer_ids.count * 100 / poster_ids.count
  end

  def result_list
    poster_ids.each_with_index.map do |poster_id, idx|
      {
        poster: Poster.find(poster_id),
        answered: Party.friendly.find(answer_ids[idx])
      }
    end
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
    data[:poster_ids] = generate_posters
    data[:answer_ids] = []
  end

  def generate_posters
    # pick 10 random posters
    # Poster.pluck(:id).sample(10)

    # pick 10 random parties, then pick one random poster of each
    Party.all.sample(10).map do |party|
      party.poster_ids.sample
    end
  end

end
