class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: [:new, :create]
  before_action :find_task, only: [:edit, :update, :destroy]
  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    authorize @task
    @task.user_id = @user.id
    if @task.save
      redirect_to admins_dashboard_path
    else
      render new
    end
  end

  def edit
  end

  def update
    if @task.update_params(task_params)
      redirect_to admins_dashboard_path
    else
      render edit
    end
  end

  def destroy
    @task.destroy
    redirect_to admins_dashboard_path
  end

  private

  def task_params
    params.require(:task).permit(:description, :deadline)
  end

  def find_task
    @task = Task.find(params[:id])
    authorize @task
  end

  def find_user
    @user = current_user
  end
end
