 class PhoneNumbersController < ApplicationController

    def index
        @person = Person.find(params[:person_id])
        @phone_numbers = @person.phone_numbers.all

    end

    def show

    end

    def new

    end

    def create

    end

    def destroy

    end

    def update

    end

    private 


 
 end