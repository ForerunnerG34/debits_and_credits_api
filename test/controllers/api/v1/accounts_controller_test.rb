require "test_helper"

class Api::V1::AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
    @user = users(:one)
    @other_user = users(:two)
  end

  test 'should show account' do
    get api_v1_account_url(@account), 
    headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
    as: :json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_equal @account.name, json_response['name']
  end

  test 'should forbid not authorized users' do
    get api_v1_accounts_url(), 
    as: :json
    assert_response :forbidden
  end

  test 'should not show account from another user' do
    get api_v1_account_url(@account), 
    headers: { Authorization: JsonWebToken.encode(user_id: @other_user.id) },
    as: :json
    assert_response :not_found
  end

  test 'should show accounts' do
    get api_v1_accounts_url(),
    headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
    as: :json
    assert_response :success    
  end
end
