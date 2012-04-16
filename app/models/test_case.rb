class TestCase < ActiveRecord::Base
  attr_accessible :duration, :status, :test_id, :test_name, :test_suite
end
