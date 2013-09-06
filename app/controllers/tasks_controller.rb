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
  	@task.save
  	redirect_to action: :show, id: @task.id
  end

  # No commands used in Rails 4.0
  def show
    redirect_to action: :show, id: @task.id
  end

  # No commands used in Rails 4.0
  def edit
    @task = Task.find(params[:id])  # Why not use task_params??
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
