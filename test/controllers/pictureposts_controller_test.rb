require 'test_helper'

class PicturepostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get pictureposts_new_url
    assert_response :success
  end

  test 'should get show' do
    get pictureposts_show_url
    assert_response :success
  end
end
