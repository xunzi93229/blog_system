module SessionsHelper

  # 这是将会话存储起来
  #利用cookies方法创建的是持久的cookie 而session方法创建的cookie是临时的会话，浏览器关闭后 失效
  def log_in(user)
    session[:user_id] = user.id
  end

  #这是后续的请求可以读取出来
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
=begin
  @current_user ||= User.find_by(id: session[:user_id])
  这句话的意思相当于:
  if @current_user.nil?
    @current_user = User.find_by(id: session[:user_id])
  else
    @current_user
  end
  
=end

  def logged_in?
    !current_user.nil?
  end

# 退出当前的用户 
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end


