require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | Ruby on Rails Tutorial Blog"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | Ruby on Rails Tutorial Blog"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Ruby on Rails Tutorial Blog"
  end
# assert_select 的作用是检查有没有指定的HTML标签，这种方法叫做“选择符”
# assert_select "title", "Home | Ruby on Rails Tutorial Blog"
# 这行代码的作用是检查有没有<title> 标签，以及里面的内容是不是字符串Home | Ruby on Rails Tutorial Blog

end
