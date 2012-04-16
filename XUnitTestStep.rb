class XUnitTestStep
  
  attr_accessor :test_id, :name, :time, :status

	def initialize(test_id, name, run_time, status)
		@test_id = test_id
		@name = name
		@time = run_time
		@status = status
	end
end