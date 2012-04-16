require "nokogiri"
require "CSV"
require File.expand_path(File.dirname(__FILE__) + '/XUnitTestStep.rb')
require File.expand_path(File.dirname(__FILE__) + '/XUnitTestSuite.rb')

  begin
    results = Nokogiri::XML(open("BillingTestData2.xml"))
  rescue
    return "error could not open file"
  end
  	xml_testsuite = results.search('testsuite')
  	CSV.open("bi_testCase.csv", "w") do |csv|
  	testSuite = XUnitTestSuite.new(xml_testsuite.attr('suite_id'),
  	                 xml_testsuite.attr('errors'),
  							 	   xml_testsuite.attr('failures'),
  							 	   xml_testsuite.attr('passes'),
  							 	   xml_testsuite.attr('tests'),
  							 	   xml_testsuite.attr('time'),
  							 	   xml_testsuite.attr('timestamp'),
   							 	   xml_testsuite.attr('tag'),
   							 	   xml_testsuite.attr('release')
  								   )
 tests = results.search('testcase')
	tests.each do |test_line|
		testStep = XUnitTestStep.new(test_line.attr('test_id'),
									 test_line.attr('name'),
									 test_line.attr('time'),
			             test_line.attr('status')
									 )
				
  csv << [testSuite.suite_id, testStep.test_id, testSuite.tag, testStep.time, testSuite.timestamp, testSuite.release, testStep.status]
 end
 end