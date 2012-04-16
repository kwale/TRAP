PASS = "pass"
FAIL = "fail"
ERROR = "error"

class TestCaseFilter

  def initialize(test_cases)
    @test_cases = test_cases
  end

  def filter(tag, status)
    @test_cases.select{|testcase| testcase.tag == tag and testcase.status == status}
  end

  def passes(tag)
    filter(tag, PASS)
  end

  def failures(tag)
    filter(tag, FAIL)
  end

  def errors(tag)
    filter(tag, ERROR)
  end

end