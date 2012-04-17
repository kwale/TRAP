class RenameColumns < ActiveRecord::Migration
  def up
    rename_column :bi_testcases, :time, :execution_time
    rename_column :test_cases, :duration, :execution_time
    rename_column :test_cases, :test_id, :test_case_id
    rename_column :test_suites, :name, :test_suite
    rename_column :test_suites, :time, :timestamp
  end

  def down
  end
end
