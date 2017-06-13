class TasklistsController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :new, :create, :edit,]
  before_action :set_tasklist, :current_user,  only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      @tasklists = current_user.tasklists.order(created_at: :desc)
    end
  end

  def new
    @tasklist = current_user.tasklists.build
  end

  def create
    @tasklist = current_user.tasklists.build(tasklist_params)
    if @tasklist.save
      flash[:success] = "Tasklistが登録されました"
      redirect_to @tasklist
    else
      flash.now[:danger] = "Tasklistの登録にしっぱいしました。もう一度やり直してください。"
      render :new
    end
  end

  def update
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
    @tasklist.destroy
    flash[:success] = "タスクは削除されました"
    redirect_to tasklists_url 
  end

  private

  #Strong Parameter
  def tasklist_params
    params.require(:tasklist).permit(:content, :status)
  end

  def correct_user
    redirect_to root_url if @tasklist.user != current_user
  end

  def set_tasklist
    redirect_to root_url if @tasklist != Tasklist.find(params[:id])
  end
end
