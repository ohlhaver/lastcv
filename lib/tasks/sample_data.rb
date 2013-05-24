namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    50.times do |n|
      name  = Faker::Company.name
      year = 1900+rand(111)
      rating = 1+rand(10)
      watched = (1 == rand(2) ? true : false)
      imdb_id = rand(1000000)
      Movie.create!(:name => name,
                    :year => year,
                    :rating => rating,
                    :watched => watched,
                    :imdb_id => imdb_id)
    end
  end
end