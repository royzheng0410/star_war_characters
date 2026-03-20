class HomeController < ApplicationController
  def index
    @q = Person.ransack(params[:q])
    @people = @q.result.includes(:locations, :affiliations).joins(:locations, :affiliations).page(params[:page]).per(5)
  end
end
