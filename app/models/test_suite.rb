class TestSuite < ActiveRecord::Base
  attr_accessible :Nr_tests, :execution_time, :failures, :name, :passed, :release, :tag, :time
end
