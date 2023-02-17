class AddressesController < ApplicationController
  
  before_action :set_address, only: %i[ show edit update destroy ]
  before_action :set_person

  # GET people/:id/addresses or /addresses.json
  def index
    @addresses = @person.addresses.all
  end

  # GET people/:id/addresses/1 or /addresses/1.json
  def show
    @person = Person.find(params[:person_id])
    @address = @person.addresses.find(params[:id])
  end

  # GET people/:id/addresses/new
  def new
    @person = Person.find(params[:person_id])
    @address = @person.addresses.new
  end

  # GET people/:id/addresses/1/edit
  def edit
  end

  # POST people/:id/addresses or /addresses.json
  def create
    
    @person = Person.find(params[:person_id])
    @address = @person.addresses.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to person_addresses_path(@address), notice: "Address was successfully created." }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
    
      end
    
    end
  
  end

  # PATCH/PUT people/:id/addresses/1 or /addresses/1.json
  def update
    
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to address_url(@address), notice: "Address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
    
      end
    
    end
  
  end

  # DELETE people/:id/addresses/1 or /addresses/1.json
  def destroy
    
    @person = Person.find(params[:person_id])
    @address = @person.addresses.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to addresses_url, notice: "Address was successfully destroyed." }
      format.json { head :no_content }
    
    end
  
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_address
    
      @address = Address.find(params[:id])
    
    end

    def set_person

      @person = Person.find(params[:person_id])
    
    end

    # Only allow a list of trusted parameters through.
    def address_params
    
      params.require(:address).permit(:street, :city, :state, :zipcode)
    
    end
end
