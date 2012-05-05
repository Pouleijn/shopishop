namespace :db do
  desc "Resets the database, runs (drop, create, migrate, seed, test:prepares)"
  task :reset => :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke
    Rake::Task['db:seed'].invoke
  end

end