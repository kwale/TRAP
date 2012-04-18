class BiTestcase < ActiveRecord::Base
  attr_accessible :release, :status, :suite_id, :tag, :test_case_id, :execution_time, :timestamp, :environment
end
