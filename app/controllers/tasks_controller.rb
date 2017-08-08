class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(allowed_params)
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(allowed_params)
    redirect_to tasks_path
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def allowed_params
    params.require(:task).permit(:title, :description)
  end
end
