class SchoolsController < ApplicationController
  def index
    @schools = School.order(:name)
  end

  def show
    @school = School.find(params[:id])
    @spells = @school.spells.page(params[:page]).per(50)
  end
end
