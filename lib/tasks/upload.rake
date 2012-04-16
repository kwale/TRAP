namespace :db do

  task :update do
    Rake::Task["db:load_test_case_data"].invoke
    Rake::Task["db:load_bi_test_case_data"].invoke
    Rake::Task["db:load_test_suite_data"].invoke
  end

end