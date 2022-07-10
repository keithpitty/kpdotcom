# coding : utf-8

namespace :app do

  task reset: :environment do
    puts 'Cleaning the database...'
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
    puts 'Seeding the database again...'
    Rake::Task["db:seed"].invoke
    puts 'Done.'
  end
end
