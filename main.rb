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
  	CSV.open("testCase.csv", "w") do |csv|
    CSV.open("testSuite.csv", "w") do |csv2|
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
    csv2 << [testSuite.suite_id,testSuite.errors,testSuite.passes, 
      testSuite.tests,testSuite.time, testSuite.timestamp,testSuite.tag, testSuite.release]
	tests = results.search('testcase')

	tests.each do |test_line|
		testStep = XUnitTestStep.new(test_line.attr('test_id'),
									 test_line.attr('name'),
									 test_line.attr('time'),
			             test_line.attr('status')
									 )
				
  csv << [testStep.test_id, testStep.name,testStep.time,testStep.status,testSuite.suite_id]
 end
 end
 end