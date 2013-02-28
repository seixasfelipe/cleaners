class TasksController < ApplicationController
  def index
  	@tasks = Task.all

  	respond_to do |format|
  		format.html
  		format.json { render :json => @tasks }
  	end
  end
end
