class ModelsController < ApplicationController
  before_filter :authenticate_agency!

  # GET /models
  # GET /models.json
  def index
    @models = current_agency.models

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @models }
    end
  end

  # GET /models/1
  # GET /models/1.json
  def show
    @model = current_agency.models.find_by_id(params[:id])

    respond_to do |format|
      redirect_to models_path and return unless @model
      format.html # show.html.erb
      format.json { render json: @model }
    end
  end

  # GET /models/new
  # GET /models/new.json
  def new
    @model = Model.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @model }
    end
  end

  # GET /models/1/edit
  def edit
    @model = current_agency.models.find_by_id(params[:id])

    redirect_to models_path and return unless @model
    @model
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(params[:model])
    @model.agency = current_agency

    respond_to do |format|
      if @model.save
        format.html { redirect_to @model, notice: 'Model was successfully created.' }
        format.json { render json: @model, status: :created, location: @model }
      else
        format.html { render action: "new" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /models/1
  # PUT /models/1.json
  def update
    @model = current_agency.models.find_by_id(params[:id])

    respond_to do |format|
      redirect_to models_path and return unless @model
      if @model.update_attributes(params[:model])
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model = current_agency.models.find_by_id(params[:id])
    @model.destroy if @model

    respond_to do |format|
      redirect_to models_path and return unless @model
      format.html { redirect_to models_url }
      format.json { head :no_content }
    end
  end
end
