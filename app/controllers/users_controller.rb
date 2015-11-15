class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show 
    @user = User.find(params[:id])
  end

  def create 
    @user = User.new(user_params)#健壮参数的使用可以确定要选择接受的数据
    #@user = User.new(params[:user])
    # = @user = User.new(name: ...,email .....)
    if @user.save
      flash[:success] = "Congratulations on the success of the registration"
      redirect_to @user
      #Deal with the registered success!
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end