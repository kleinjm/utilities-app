class UtilitiesController < ApplicationController
  # GET /utilities
  # GET /utilities.json
  def index
    @utilities = Utility.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @utilities }
    end
  end

  # GET /utilities/1
  # GET /utilities/1.json
  def show
    @utility = Utility.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @utility }
    end
  end

  # GET /utilities/new
  # GET /utilities/new.json
  def new
    @utility = Utility.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @utility }
    end
  end

  # GET /utilities/1/edit
  def edit
    @utility = Utility.find(params[:id])
  end

  # POST /utilities
  # POST /utilities.json
  def create
    @utility = Utility.new(params[:utility])

    respond_to do |format|
      if @utility.save
        format.html { redirect_to utilities_path, notice: 'Utility was successfully created.' }
        format.json { render json: @utility, status: :created, location: @utility }
      else
        format.html { render action: "new" }
        format.json { render json: @utility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /utilities/1
  # PUT /utilities/1.json
  def update
    @utility = Utility.find(params[:id])

    respond_to do |format|
      if @utility.update_attributes(params[:utility])
        format.html { redirect_to utilities_path, notice: 'Utility was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @utility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utilities/1
  # DELETE /utilities/1.json
  def destroy
    @utility = Utility.find(params[:id])
    @utility.destroy

    respond_to do |format|
      format.html { redirect_to utilities_url }
      format.json { head :no_content }
    end
  end
end
