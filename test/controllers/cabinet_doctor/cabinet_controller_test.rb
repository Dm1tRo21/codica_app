require "test_helper"

class CabinetDoctor::CabinetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cabinet_doctor_cabinet_index_url
    assert_response :success
  end
end
