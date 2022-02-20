require "test_helper"

class Api::V1::JournalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @journal = journals(:one)
    @user = users(:one)
    @other_user = users(:two)
  end

  test 'should show journal' do
    get api_v1_journal_url(@journal), 
    headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
    as: :json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_equal @journal.description, json_response['description']
  end

  test 'should forbid show journal from another user' do
    get api_v1_journal_url(@journal), 
    headers: { Authorization: JsonWebToken.encode(user_id: @other_user.id) },
    as: :json
    assert_response :forbidden
  end
end


