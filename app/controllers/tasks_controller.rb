class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      @tasks = current_user.tasks.includes(:category)
    else
      @tasks = Task.none
    end
    render json: @tasks, include: :category
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date, :category_id)
  end
end
