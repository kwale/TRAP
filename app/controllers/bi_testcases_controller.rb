class BiTestcasesController < ApplicationController
  # GET /bi_testcases
  # GET /bi_testcases.json
  def index
    @bi_testcases = BiTestcase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bi_testcases }
    end
  end

  # GET /bi_testcases/1
  # GET /bi_testcases/1.json
  def show
    @bi_testcase = BiTestcase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bi_testcase }
    end
  end

  # GET /bi_testcases/new
  # GET /bi_testcases/new.json
  def new
    @bi_testcase = BiTestcase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bi_testcase }
    end
  end

  # GET /bi_testcases/1/edit
  def edit
    @bi_testcase = BiTestcase.find(params[:id])
  end

  # POST /bi_testcases
  # POST /bi_testcases.json
  def create
    @bi_testcase = BiTestcase.new(params[:bi_testcase])

    respond_to do |format|
      if @bi_testcase.save
        format.html { redirect_to @bi_testcase, notice: 'Bi testcase was successfully created.' }
        format.json { render json: @bi_testcase, status: :created, location: @bi_testcase }
      else
        format.html { render action: "new" }
        format.json { render json: @bi_testcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bi_testcases/1
  # PUT /bi_testcases/1.json
  def update
    @bi_testcase = BiTestcase.find(params[:id])

    respond_to do |format|
      if @bi_testcase.update_attributes(params[:bi_testcase])
        format.html { redirect_to @bi_testcase, notice: 'Bi testcase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bi_testcase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bi_testcases/1
  # DELETE /bi_testcases/1.json
  def destroy
    @bi_testcase = BiTestcase.find(params[:id])
    @bi_testcase.destroy

    respond_to do |format|
      format.html { redirect_to bi_testcases_url }
      format.json { head :no_content }
    end
  end
end
