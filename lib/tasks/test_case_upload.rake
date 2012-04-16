namespace :db do

  desc "load user data from csv"
  task :load_test_case_data  => :environment do
    require 'CSV'

    CSV.foreach("testCase.csv") do |row|
      TestCase.create(
        :test_id => row[0],
        :test_name => row[1],
        :duration => row[2],
        :status => row[3],
        :test_suite => row[4],
      )
    end
  end
end