require 'counted_each'

namespace :migrate do
  desc 'migrates question/answer data from runs to question table'
  task :questions => :environment do
    Question.delete_all
    Run.all.to_a.counted_each do |run|
      next if run.poster_ids.blank?
      run.poster_ids.each_with_index do |poster_id, idx|
        answered_party_id = run.answer_ids[idx]
        answered_party_id &&= Party.friendly.find(answered_party_id).id
        Question.create(
          run: run,
          poster_id: poster_id,
          answered: !!answered_party_id,
          answered_party_id: answered_party_id,
          position: idx
        )
      end
    end
  end
end
