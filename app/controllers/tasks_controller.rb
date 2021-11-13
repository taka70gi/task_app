class TasksController < ApplicationController
  
  def index
    @tasks = Task.all.order(end_on: :ASC)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      flash[:notice] = "新規スケジュールを登録しました"
      redirect_to:tasks
    else
      flash[:alert] = "新規スケジュールを登録できませんでした"
      render "new"  
    end
  end

  def show
    @task = Task.find(params[:id])
    @test = @task.all_day
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(tasks_params)
      flash[:notice] = "idが「#{@task.id}」のスケジュールを更新しました"
      redirect_to :tasks
    else
      flash[:alert] = "idが「#{@task.id}」のスケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :tasks
  end
end

private
def tasks_params
  params.require(:task).permit(:title, :start_on, :end_on, :all_day, :introduction)
end