namespace :db do

  desc "load user data from csv"
  task :load_bi_test_case_data  => :environment do
    require 'CSV'

    CSV.foreach("bi_testCase.csv") do |row|
      BiTestcase.create(
        :suite_id => row[0],
        :test_case_id => row[1],
        :tag => row[2],
        :time => row[3],
        :timestamp => row[4],
        :release => row[5],
        :status => row[6]
      )
    end
  end
end