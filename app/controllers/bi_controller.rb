class BiController < ApplicationController
  def index
    @bi_testcases = BiTestcase.all

    @tag_names = @bi_testcases.collect{ |bi_testcase| bi_testcase.tag }.uniq
    @graph_data = Array.new

    @tag_names.each do |tag|
      @tag = Tag.new
      @tag.name = tag

      @tag.pass = @bi_testcases.select{|testcase| testcase.tag == tag and testcase.status == "pass"}.count
      @tag.fail = @bi_testcases.select{|testcase| testcase.tag == tag and testcase.status == "fail"}.count
      @tag.error = @bi_testcases.select{|testcase| testcase.tag == tag and testcase.status == "error"}.count

      @graph_data.push(@tag)
    end

    respond_to do |format|
      format.json { render json: @graph_data }
    end

  end
end

