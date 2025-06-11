class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(completed: !@task.completed)
    respond_to do |format|
      format.json { render json: { completed: @task.completed } }
    end
  end
end
