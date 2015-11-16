class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
=begin
    # 这个语法是很简单的，因为要检测 获得的用户 和数据库中的用户 是一样的 
    给user对象  user对象中包括这 这个用户的数据，
    要检测这个设置的密码和提交的密码是否是一样
=end
    if user&&user.authenticate(params[:session][:password])
      # 都为真才是真
      # 登陆用户，然后重定向到用户的资料页面
      log_in user
      redirect_to user
    else
      #创建一个错误消息
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end