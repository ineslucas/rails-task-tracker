class ChecklistsController < ApplicationController
  def index
    @checklists = Checklist.all
  end

  def new
    @checklist = Checklist.new
  end

  def create
    @checklist = Checklist.new(params[:checklist])
    @checklist.save
    redirect_to checklists_path(@checklist)
  end

  private

  def checklist_params
    params.require(:checklist).permit(:title, :category, :description)
  end
end
