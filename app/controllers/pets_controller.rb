class PetsController < ApplicationController
  # GET /pets
  # GET /pets.json
  def index
    @customer = Customer.find(params[:customer_id])
    @pets = @customer.pets

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pets }
    end
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @customer = Customer.find(params[:customer_id])
    @pet = Pet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pet }
    end
  end

  # GET /pets/new
  # GET /pets/new.json
  def new
    @customer = Customer.find(params[:customer_id])
    @pet = Pet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pet }
    end
  end

  # GET /pets/1/edit
  def edit
    @customer = Customer.find(params[:customer_id])
    @pet = Pet.find(params[:id])
  end

  # POST /pets
  # POST /pets.json
  def create
    @customer = Customer.find(params[:customer_id])
    @pet = @customer.pets.build(params[:pet])

    respond_to do |format|
      if @pet.save
        format.html { redirect_to customer_pet_path(@customer, @pet), notice: 'Pet was successfully created.' }
        format.json { render json: @pet, status: :created, location: customer_pet_path(@@customer, @pet) }
      else
        format.html { render action: "new" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pets/1
  # PUT /pets/1.json
  def update
    @customer = Customer.find(params[:customer_id])
    @pet = Pet.find(params[:id])

    respond_to do |format|
      if @pet.update_attributes(params[:pet])
        format.html { redirect_to customer_pet_path(@customer, @pet), notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @customer = Customer.find(params[:customer_id])
    @pet = Pet.find(params[:id])
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to customer_pets_url(@customer) }
      format.json { head :no_content }
    end
  end
end
