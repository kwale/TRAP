class BiTestcase < ActiveRecord::Base
  attr_accessible :release, :status, :suite_id, :tag, :test_case_id, :time, :timestamp
end
