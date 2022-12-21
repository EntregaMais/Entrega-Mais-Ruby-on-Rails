class DespachantesControllerTest < ActionDispatch::IntegrationTest
    setup do
      @despachante = despachantes(:one)
    end
  
    test 'should get index' do
      get despachantes_url, as: :json
      assert_response :success
    end
  
    test 'should create despachante' do
      assert_difference('Despachante.count') do
        post despachantes_url, params: { despachante: { nmdespachante: @despachante.nmdespachante, idtransportadora: @despachante.idtransportadora } }, as: :json
      end
  
      assert_response 201
    end
  
    test 'should show despachante' do
      get despachante_url(@despachante), as: :json
      assert_response :success
    end
  
    test 'should update despachante' do
      patch despachante_url(@despachante), params: { despachante: { nmdespachante: @despachante.nmdespachante, idtransportadora: @despachante.idtransportadora } }, as: :json
      assert_response 200
    end
  
    test 'should destroy despachante' do
      assert_difference('Despachante.count', -1) do
        delete despachante_url(@despachante), as: :json
      end
  
      assert_response 204
    end
  end
  