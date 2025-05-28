class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]
  after_action :verify_authorized, except: [ :index, :new, :create ]

  def index
    @tasks = policy_scope(Task).includes(:category)

    if params[:status].present? && Task.statuses.key?(params[:status])
      @tasks = @tasks.where(status: params[:status])
    end

    respond_to do |format|
      format.html
      format.json { render json: @tasks, include: :category }
    end
  end

  def admin_index
    authorize Task, :admin_index?
    @tasks = policy_scope(Task).includes(:user, :category)
    render :index
  end

  def show
    authorize @task
  end

  def new
    @task = current_user.tasks.new
  end

  def edit
    authorize @task
  end

  def create
    @task = current_user.tasks.new(task_params)
    authorize @task

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: "Задача успешно создана." }
        format.json { render json: @task, status: :created }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @task

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: "Задача успешно обновлена." }
        format.json { render json: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @task
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Задача успешно удалена." }
      format.json { head :no_content }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date, :category_id)
  end
end
