require "test_helper"

class CabinetPatient::CabinetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cabinet_patient_cabinet_index_url
    assert_response :success
  end
end
