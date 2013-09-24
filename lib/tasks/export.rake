require 'csv'

namespace :export do
  desc 'export all csv files'
  task :all => [:questions, :parties] do
  end

  # run_id(internal) | run_id(external) | poster_id | poster url | party_id | answered? | answered_party_id
  desc 'export answered questions'
  task :questions => :environment do
    export_file = "#{Rails.root}/tmp/questions.csv"
    puts "exporting questions data to #{export_file}"

    CSV.open(export_file, 'wb') do |csv|
      csv << %w(run_id ext_id poster_id poster_url party_id answered? answered_party_id) unless disable_header?
      Question.includes(:run, :poster).to_a.counted_each do |q|
        next if q.poster.blank?
        csv << [q.run_id, q.run.extid, q.poster_id, q.poster.url.url, q.poster.party_id, q.answered?, q.answered_party_id]
      end
    end
  end

  # party_id | Kürzel bzq. Vollname | anzahl poster | angezeigte poster | wie oft fehlerhaft gewählt | wie oft richtig gewählt
  task :parties => :environment do
    export_file = "#{Rails.root}/tmp/parties.csv"
    puts "exporting party data to #{export_file}"

    CSV.open(export_file, 'wb') do |csv|
      csv << %w(party_id name num_posters shown_posters incorrect_answers correct_answers) unless disable_header?
      Party.includes(:posters).to_a.counted_each do |p|
        next if p.posters.blank?

        shown_questions = Question.answered.where(poster_id: p.posters.select(:id))
        correct_answers = shown_questions.includes(:poster).select { |q| q.correct_answer? }.count
        incorrect_answers = shown_questions.count - correct_answers

        csv << [p.id, p.display_name, p.posters.count, shown_questions.count, incorrect_answers, correct_answers]
      end
    end
  end

  def disable_header?
    ENV['DISABLE_HEADER'] =~ /(yes|1)/
  end
end
