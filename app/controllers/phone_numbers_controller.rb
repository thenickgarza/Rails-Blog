 class PhoneNumbersController < ApplicationController

    before_action :authenticate_user!

    def index
        
    
        @phone_numbers = @person.phone_numbers.all

    end

    def show

    end

    def new
        @person = Person.find(params[:person_id])
        @phone_number = PhoneNumber.new
    
    end

    def create
        
        @person = Person.find(params[:person_id])
        @phone_number = @person.phone_numbers.new(phone_number_params)

        respond_to do |format|
            if @phone_number.save
              format.html { redirect_to root_path, notice: "Number was successfully created." }
              format.json { render :show, status: :created, location: @post }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @phone_number.errors, status: :unprocessable_entity }
            end
          end
     end

    def destroy

    end

    def update

    end

    private 

    def phone_number_params
        params.require(:phone_number).permit(:person_id, :number)
      end
 
 end