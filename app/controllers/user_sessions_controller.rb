class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password], params[:remember])
    if @user
      redirect_back_or_to root_path, success:'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, success:'ログアウトしました', status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :remember)
  end
end
