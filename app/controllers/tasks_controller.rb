class TasksController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "タスクが正常に追加されました"
      redirect_to @task
    else
      flash.now[:danger] = "タスクが追加されませんでした"
      render :new
    end
    
  end
  
  def new
    @task = Task.new
  end
  
  def edit
    
  end
  
  def show
    
  end
  
  def update
    
    
    if @task.update(task_params)
      flash[:success] = "タスクが正常に編集されました"
      redirect_to @task
    else  
      flash.now[:danger] = "タスクは編集されませんでした"
      render :edit
    end
  end
  
  def destroy
    
    @task.destroy
    
    flash[:success] = "タスクが正常に削除されました"
    redirect_to tasks_url
  end
  
  private
  
  def set_message
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content)
  end
  
end
