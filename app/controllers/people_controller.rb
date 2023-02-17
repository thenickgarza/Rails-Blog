class PeopleController < ApplicationController

    def index
        @people = current_user.people.all
    end

    def show

    end

    def new
        @user = current_user
        @person = @user.people.new
    end

    def create
        @user = current_user
        @person = @user.people.new(people_params)

        respond_to do |format|
            if @person.save
              format.html { redirect_to people_path, notice: "Person was successfully created." }
              format.json { render :show, status: :created, location: @person }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @person.errors, status: :unprocessable_entity }
            end
          end
    end

    def destroy

    end

    private

    def set_user
        @user = current_user
    end

    def set_person 
        @person = People.find(params[:id])
    end

    def people_params
        params.require(:person).permit(:user_id, :first_name, :last_name)
      end
end