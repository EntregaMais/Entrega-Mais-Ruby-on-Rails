class PolisControllerTest < ActionDispatch::IntegrationTest
    setup do
      @poli = polis(:one)
    end
  
    test 'should get index' do
      get polis_url, as: :json
      assert_response :success
    end
  
    test 'should create poli' do
      assert_difference('Poli.count') do
        post polis_url, params: { poli: { idapi: @poli.idapi, nmcidade: @poli.nmcidade, idtrajeto: @poli.idtrajeto } }, as: :json
      end
  
      assert_response 201
    end
  
    test 'should show poli' do
      get poli_url(@poli), as: :json
      assert_response :success
    end
  
    test 'should update poli' do
      patch poli_url(@poli), params: { poli: { idapi: @poli.idapi, nmcidade: @poli.nmcidade, idtrajeto: @poli.idtrajeto } }, as: :json
      assert_response 200
    end
  
    test 'should destroy poli' do
      assert_difference('Poli.count', -1) do
        delete poli_url(@poli), as: :json
      end
  
      assert_response 204
    end
  end
  