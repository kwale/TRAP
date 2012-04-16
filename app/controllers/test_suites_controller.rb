class TestSuitesController < ApplicationController
  # GET /test_suites
  # GET /test_suites.json
  def index
    @test_suites = TestSuite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test_suites }
    end
  end

  # GET /test_suites/1
  # GET /test_suites/1.json
  def show
    @test_suite = TestSuite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test_suite }
    end
  end

  # GET /test_suites/new
  # GET /test_suites/new.json
  def new
    @test_suite = TestSuite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test_suite }
    end
  end

  # GET /test_suites/1/edit
  def edit
    @test_suite = TestSuite.find(params[:id])
  end

  # POST /test_suites
  # POST /test_suites.json
  def create
    @test_suite = TestSuite.new(params[:test_suite])

    respond_to do |format|
      if @test_suite.save
        format.html { redirect_to @test_suite, notice: 'Test suite was successfully created.' }
        format.json { render json: @test_suite, status: :created, location: @test_suite }
      else
        format.html { render action: "new" }
        format.json { render json: @test_suite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test_suites/1
  # PUT /test_suites/1.json
  def update
    @test_suite = TestSuite.find(params[:id])

    respond_to do |format|
      if @test_suite.update_attributes(params[:test_suite])
        format.html { redirect_to @test_suite, notice: 'Test suite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test_suite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_suites/1
  # DELETE /test_suites/1.json
  def destroy
    @test_suite = TestSuite.find(params[:id])
    @test_suite.destroy

    respond_to do |format|
      format.html { redirect_to test_suites_url }
      format.json { head :no_content }
    end
  end
end
