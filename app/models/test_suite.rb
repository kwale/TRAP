class TestSuite < ActiveRecord::Base
  attr_accessible :Nr_tests, :execution_time, :failures, :test_suite, :passed, :release, :tag, :timestamp
end
