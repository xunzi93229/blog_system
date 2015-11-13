require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "layout links" do
    get root_path;
    assert_template 'static_pages/home'
    # 这是 assert_select 方法的一些高级的用法,同时指定标签  a和属性  href  检查有没有指定链接
    assert_select "a[href=?]",root_path, count:2
    assert_select "a[href=?]",root_path
    assert_select "a[href=?]",help_path
    assert_select "a[href=?]",about_path
    assert_select "a[href=?]",contact_path
    
    get signup_path
    assert_select "title",full_title("Sign up")
  end
end
