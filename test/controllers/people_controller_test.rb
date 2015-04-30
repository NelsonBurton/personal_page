require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  def setup
  end
  test "should get home" do
    get :home
    assert_response :success
  end
  test "should get create" do
  	pr = {:age => 23, :weight => 181, :height => 73, :bodyfat => 21}
  	post :create , :person => pr
  	assert_response :success
  	assert_template 'people/table'
  	assert_select "table", count: 1
  end
  
  
end
