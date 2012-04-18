class TestCase < ActiveRecord::Base
  attr_accessible :execution_time, :status, :test_case_id, :test_name, :test_suite, :environment
end
