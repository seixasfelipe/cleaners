class TasksController < ApplicationController
  def index
  	@tasks = Task.all

  	respond_to do |format|
  		format.html
  		format.json { render :json => @tasks }
  	end
  end

  def new
  	@task = Task.new

  	respond_to do |format|
  		format.html
  		format.json { render :json => @task }
  	end
  end

  def create
  	@task = Task.new(params[:task])
 
  	respond_to do |format|
  		if @task.save
  		  format.html  { redirect_to(tasks_url,
  		                :notice => 'Tarefa criada com sucesso.') }
  		  format.json  { render :json => @task,
  		                :status => :created, :location => @task }
  		else
  		  format.html  { render :action => "new" }
  		  format.json  { render :json => @task.errors,
  		                :status => :unprocessable_entity }
  		end
  	end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
   
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html  { redirect_to(tasks_url,
                      :notice => 'Tarefa atualizada com sucesso.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @task.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
   
    respond_to do |format|
      format.html { redirect_to tasks_url,
                    :notice => 'Tarefa "%s" removida com sucesso.' % @task.name }
      format.json { head :no_content }
    end
  end
end
