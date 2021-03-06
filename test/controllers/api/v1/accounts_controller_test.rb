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

  test 'should create account' do
    post api_v1_accounts_url,
    headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
    params: { account: { name: 'Test debit account', is_debit: true }},
    as: :json
    assert_response :created
  end

  test 'should update existing account' do
    patch api_v1_account_url(@account),
    headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
    params: { account: { name: 'Updated test debit account' }},
    as: :json
    assert_response :success
  end

  test 'should delete account' do
    assert_difference('Account.count', -1) do
      delete api_v1_account_url(@user), 
      headers: { Authorization: JsonWebToken.encode(user_id: @user.id) }, 
      as: :json
    end
    assert_response :no_content
  end

end
