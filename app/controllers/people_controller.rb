class PeopleController < ApplicationController
  def import
    begin 
      Person.transaction do
        if params[:person].present?
          Person.import(person_params[:file])
          flash[:notice] = "Success"
        else
          flash[:alert] = "Please include a valid csv file"
        end
      end
    rescue => e
      flash[:alert] = e.message + " Please try again"
    end
    redirect_to root_path
  end

  private

  def person_params
    params.require(:person).permit(:file)
  end
end