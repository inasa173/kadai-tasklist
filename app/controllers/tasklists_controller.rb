class TasklistsController < ApplicationController

  def index
    @tasklists = Tasklist.all
  end

  def show
    @tasklist = Tasklist.find(params[:id])
  end

  def new
    @tasklist = Tasklist.new
  end

  def create
    @tasklist = Tasklist.new(tasklist_params)
    if @tasklist.save
      flash[:success] = "Tasklistが登録されました"
      redirect_to @tasklist
    else
      flash.now[:danger] = "Tasklistの登録にしっぱいしました。もう一度やり直してください。"
      render :new
    end
  end

  def edit
    @tasklist = Tasklist.find(params[:id])
  end

  def update
    @tasklist = Tasklist.find(params[:id])

    if @tasklist.update(tasklist_params)
      flash[:success] = 'Tasklist は正常
に更新されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'Tasklist は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasklist = Tasklist.find(params[:id])
    @tasklist.destroy

    flash[:success] = "タスクは削除されました"
    redirect_to tasklists_url 
  end

  private

  #Strong Parameter
  def tasklist_params
    params.require(:tasklist).permit(:content)
  end
end
