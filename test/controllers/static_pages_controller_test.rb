require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @bases_title = "Ruby on Rails Tutorial Blog"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "#{@bases_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@bases_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | #{@bases_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@bases_title}"
  end
# assert_select 的作用是检查有没有指定的HTML标签，这种方法叫做“选择符”
# assert_select "title", "Home | Ruby on Rails Tutorial Blog"
# 这行代码的作用是检查有没有<title> 标签，以及里面的内容是不是字符串Home | Ruby on Rails Tutorial Blog

end
