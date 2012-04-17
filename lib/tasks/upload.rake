require 'CSV'
require "nokogiri"

$assets_dir = "lib/assets/"
$xml_dir = "#{$assets_dir}xml"


namespace :db do

  task :upload => :environment do
    process_xml($xml_dir) {|file_name| load_bi_from_xml(file_name)}
    process_xml($xml_dir) {|file_name| load_test_cases_from_xml(file_name)}
    process_xml($xml_dir) {|file_name| load_test_suite_from_xml(file_name)}
  end

end

def process_xml(dir_name, &block)
  Dir.foreach(dir_name) do |file_name|
    block.call("#{dir_name}/#{file_name}") if File.extname(file_name) == ".xml"
  end
end

def load_bi_from_xml(xml_file)
  results = Nokogiri::XML(open(xml_file))

  xml_testsuite = results.search('testsuite')
  suite_id, tag, timestamp, release = xml_testsuite.attr('suite_id').value, xml_testsuite.attr('tag').value, xml_testsuite.attr('timestamp').value, xml_testsuite.attr('release').value

  tests = results.search('testcase')
  tests.each do |test_line|


    BiTestcase.create(
        :suite_id => suite_id,
        :tag => tag,
        :timestamp => timestamp,
        :release => release,
        :test_case_id => test_line.attr('test_id'),
        :execution_time => test_line.attr('time'),
        :status => test_line.attr('status')
    )
  end
end


def load_test_cases_from_xml(xml_file)
  results = Nokogiri::XML(open(xml_file))

  xml_testsuite = results.search('testsuite')
  suite_id = xml_testsuite.attr('suite_id').value

  tests = results.search('testcase')
  tests.each do |test_line|

    TestCase.create(
        :test_suite => suite_id,
        :test_case_id => test_line.attr('test_id'),
        :execution_time => test_line.attr('time'),
        :test_name => test_line.attr('name'),
        :status => test_line.attr('status')
    )
  end
end

def load_test_suite_from_xml(xml_file)
  results = Nokogiri::XML(open(xml_file))

  xml_testsuite = results.search('testsuite')

  TestSuite.create(
      :test_suite => xml_testsuite.attr('suite_id').value,
      :failures =>   xml_testsuite.attr('failures').value,
      :passed =>  xml_testsuite.attr('passes').value,
      :Nr_tests => xml_testsuite.attr('tests').value,
      :execution_time => xml_testsuite.attr('time').value,
      :timestamp => xml_testsuite.attr('timestamp').value,
      :tag =>  xml_testsuite.attr('tag').value,
      :release => xml_testsuite.attr('release').value
  )
end
