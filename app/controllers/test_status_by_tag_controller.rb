class TestStatusByTagController < ApplicationController
  def index
    @bi_testcases = BiTestcase.all

    tag_names = @bi_testcases.collect{ |bi_testcase| bi_testcase.tag }.uniq
    test_case_filter = TestCaseFilter.new(@bi_testcases)

    test_status_by_tag = Array.new

    tag_names.each do |tag_name|
      tag = Tag.new
      tag.name = tag_name

      tag.pass = test_case_filter.passes(tag_name).count
      tag.fail = test_case_filter.failures(tag_name).count
      tag.error = test_case_filter.errors(tag_name).count

      test_status_by_tag.push(tag)
    end

    respond_to do |format|
      format.json { render json: test_status_by_tag }
    end

  end
end

