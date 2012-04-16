class XUnitTestSuite
	attr_accessor :suite_id, :errors, :failures, :passes, :tests, :time, :timestamp, :tag, :release


	def initialize(suite_id,errors, failures, passes, tests, time, timestamp, tag, release)
		@suite_id = suite_id
		@errors = errors
		@failures = failures
		@passes = passes
		@tests = tests
		@time = time
		@timestamp = timestamp
		@tag = tag
		@release = release
	end
end