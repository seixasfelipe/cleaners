class TasksController < ApplicationController
  def index
  	@tasks = Task.all

  	respond_with @tasks
  end

  def new
  	@task = Task.new

  	respond_with @task
  end

  def create
  	@task = Task.new(params[:task])
    @task.save

    respond_with @task
  end

  def edit
    @task = Task.find(params[:id])

    respond_with @task
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
   
    respond_with @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
   
    respond_with @task
  end
end
