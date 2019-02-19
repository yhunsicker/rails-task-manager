class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    Task.create(task_params)
    redirect_to tasks_path
  end

  def new
    @task = Task.new
  end

  def edit
    id = params[:id]
    @task = Task.find(id)
  end

  def update
    id = params[:id]
    @task = Task.find(id)
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    id = params[:id]
    @task = Task.find(id)
    @task.destroy

    redirect_to tasks_path
  end
end

private
  def task_params
    params.require(:task).permit(:title, :details)
  end
