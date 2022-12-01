class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password], params[:remember])
    if @user
      redirect_back_or_to new_profile_card_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, success: t('.success'), status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :remember)
  end
end
