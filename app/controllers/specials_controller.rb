class SpecialsController < ApplicationController
  skip_before_filter :require_login, :only => [:index]

  # GET /specials
  # GET /specials.json
  def index
    # index should take a param 
    if params[:lat].present? && params[:lon].present?
      # need all the vendors near first
      #@vendors = Vendor.near([params[:lat], params[:lon]], 20)
      #logger.debug params[:lat]
      #logger.debug params[:lon]
      tmpv = Vendor.new
      tmpv.coordinates = [params[:lat], params[:lon]]
      @vendors = tmpv.near(20).to_a
      #@specials = Special.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @specials }
    end
  end

  # GET /specials/1
  # GET /specials/1.json
  def show
    @special = Special.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @special }
    end
  end

  # GET /specials/new
  # GET /specials/new.json
  def new
    @special = Special.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @special }
    end
  end

  # GET /specials/1/edit
  def edit
    @special = Special.find(params[:id])
  end

  # POST /specials
  # POST /specials.json
  def create
    @special = Special.new(params[:special])

    respond_to do |format|
      if @special.save
        format.html { redirect_to @special, notice: 'Special was successfully created.' }
        format.json { render json: @special, status: :created, location: @special }
      else
        format.html { render action: "new" }
        format.json { render json: @special.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /specials/1
  # PUT /specials/1.json
  def update
    @special = Special.find(params[:id])

    respond_to do |format|
      if @special.update_attributes(params[:special])
        format.html { redirect_to @special, notice: 'Special was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @special.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specials/1
  # DELETE /specials/1.json
  def destroy
    @special = Special.find(params[:id])
    @special.destroy

    respond_to do |format|
      format.html { redirect_to specials_url }
      format.json { head :ok }
    end
  end
end
