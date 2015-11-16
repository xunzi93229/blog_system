require 'test_helper'
class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #注册失败的测试 
  test "invalid signup information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, user:{
        name: "",
        email: "user@invalid",
        password: "foo",
        password_confirmation: "bar"
      }
    end
    assert_template 'users/new'
  end
#注册成功的测试
  test "valid signup information" do
    get signup_path
    name = "Eaample name"
    email = "useremail@example.com"
    password = "foobar"
    assert_difference 'User.count',1 do
      post_via_redirect users_path, user:{
        # post_via_redirect 方法，是请求用户的资料页面
        name: name,
        email: email,
        password: password,
        password_confirmation: password
      }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end



=begin
首先 我们 使用get 方法  访问注册页面
get signup_path
为了测试提交表单后的状态  ，我们要 想users_path 发起
POST请求 ，这个操作 可以使用post 方法完成
这里要使用到 create 动作中传给 User.new 的params[:user] 哈希 我们把 post方法放在
assert_no_different 方法的代码块中，并且把assert_no_different 方法的参数设为字符串
'User.count' ，执行这段代码快时 ，会比较块中的代码执行前后的User.count 
  
=end

