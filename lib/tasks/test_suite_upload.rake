namespace :db do

  desc "load user data from csv"
  task :load_test_suite_data  => :environment do
    require 'CSV'

    CSV.foreach("testSuite.csv") do |row|
      TestSuite.create(
        :name => row[0],
        :failures => row[1],
        :passed => row[2],
        :Nr_tests => row[3],
        :execution_time => row[4],
        :time => row[5],
        :tag => row[6],
        :release => row[7]
      )
    end
  end
end