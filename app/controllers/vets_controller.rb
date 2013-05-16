class VetsController < ApplicationController
  # GET /vets
  # GET /vets.json
  def index
    @vets = Veterinary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vets }
    end
  end

  # GET /vets/1
  # GET /vets/1.json
  def show
    @vet = Veterinary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vet }
    end
  end

  # GET /vets/new
  # GET /vets/new.json
  def new
    @vet = Veterinary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vet }
    end
  end

  # GET /vets/1/edit
  def edit
    @vet = Veterinary.find(params[:id])
  end

  # POST /vets
  # POST /vets.json
  def create
    @vet = Veterinary.new(params[:vet])

    respond_to do |format|
      if @vet.save
        format.html { redirect_to @vet, notice: 'Vet was successfully created.' }
        format.json { render json: @vet, status: :created, location: @vet }
      else
        format.html { render action: "new" }
        format.json { render json: @vet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vets/1
  # PUT /vets/1.json
  def update
    @vet = Veterinary.find(params[:id])

    respond_to do |format|
      if @vet.update_attributes(params[:vet])
        format.html { redirect_to @vet, notice: 'Vet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vets/1
  # DELETE /vets/1.json
  def destroy
    @vet = Veterinary.find(params[:id])
    @vet.destroy

    respond_to do |format|
      format.html { redirect_to vets_url }
      format.json { head :no_content }
    end
  end

  # GET /vets/1/schedule
  # GET /vets/1/schedule.json
  def schedule
    @vet = Veterinary.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @vet.current_appointments}
    end
  end
end
