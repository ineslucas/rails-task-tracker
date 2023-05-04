class Task < ApplicationRecord
  belongs_to :checklist

  # why wouldn't we define this method in the TasksController?

  def completed?
    completed == true
    # this method checks whether the task has been completed and if yes, applies styling conditions to mark task as completed
  end
end
