class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_checklist

  # method 'new' not needed

  def create
    @task = @checklist.tasks.create(task_params)
    # @task.user_id = current_user.id

    if @task.save
      redirect_to @checklist, notice: 'Task added successfully'
    else
      render :new
    end
  end

  def destroy
    @task = @checklist.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Task has been deleted"
    else
      flash[:error] = "Task could not be deleted"
    end
    redirect_to @checklist, status: :see_other
  end

  private

  def set_checklist #done
    @checklist = Checklist.find(params[:checklist_id])
  end

  def task_params #done
    # it's recommended to use the require method when you're confident that a certain parameter must be present in the params hash, as it raises a more informative error message if it's not.
    params.require(:task).permit(:title, :details)
  end
end
