class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
  	@task = Task.new
  end

  def create
  	@task = Task.new(task_params)

    respond_to do |format|
  	  if @task.save
        format.html { redirect_to @task, notice: 'Good job' }
        format.json { render action: 'show', status: :created, location: @task}

  	  else
        format.html { render action: 'new'}
        format.json { render json: @task.errors, status: :unprocessable_entity }

      end
    end
  end

  # No commands used in Rails 4.0
  def show
  end

  # No commands used in Rails 4.0
  def edit
      # Why not use set_task as before_action ??
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit'}
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private
   # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
    	params.require(:task).permit(:title)
    end

end
