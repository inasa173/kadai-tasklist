class SessionsController < ApplicationController
  def new
  end

  def create
    p "*******create start"
    p params[:session]
    p email= params[:session][:email].downcase
    p password = params[:session][:password]

    if login(email, password)
      flash[:success] = 'ログインに成功しました'
      redirect_to root_url
    else
      flash.now[:danger] ='ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
  end

  private
  
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
    	session[:user_id] = @user.id
    	return true
    else
  	  return false
    end
  end
end
