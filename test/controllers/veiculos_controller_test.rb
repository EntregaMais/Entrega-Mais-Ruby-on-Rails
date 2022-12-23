class VeiculosControllerTest < ActionDispatch::IntegrationTest
    setup do
      @veiculo = veiculos(:one)
    end
  
    test 'should get index' do
      get veiculos_url, as: :json
      assert_response :success
    end
  
    test 'should create veiculo' do
      assert_difference('Veiculo.count') do
        post veiculos_url, params: { veiculo: { placa: @veiculo.placa, idrota: @veiculo.idrota, idtransportadora: @veiculo.idtransportadora } }, as: :json
      end
  
      assert_response 201
    end
  
    test 'should show veiculo' do
      get veiculo_url(@veiculo), as: :json
      assert_response :success
    end
  
    test 'should update veiculo' do
      patch veiculo_url(@veiculo), params: { veiculo: { placa: @veiculo.placa, idrota: @veiculo.idrota, idtransportadora: @veiculo.idtransportadora } }, as: :json
      assert_response 200
    end
  
    test 'should destroy veiculo' do
      assert_difference('Veiculo.count', -1) do
        delete veiculo_url(@veiculo), as: :json
      end
  
      assert_response 204
    end

    test 'test_index'
      get :index
      assert_response :success
      assert_equal Veiculo.all, assigns(:veiculos)
    end

    test 'test_show'
      veiculo = Veiculo.create(placa: 'ABC-1234', idrota: 1, idtransportadora: 2)
      get :show, params: { id: veiculo.id }
      assert_response :success
      assert_equal veiculo, assigns(:veiculo)
    end

    test 'test_create'
      assert_difference('Veiculo.count') do
        post :create, params: { veiculo: { placa: 'ABC-1234', idrota: 1, idtransportadora: 2 } }
      end
      assert_response :created
    end

    test 'test_update'
      veiculo = Veiculo.create(placa: 'ABC-1234', idrota: 1, idtransportadora: 2)
      patch :update, params: { id: veiculo.id, veiculo: { placa: 'DEF-5678', idrota: 2, idtransportadora: 3 } }
      assert_response :success
      veiculo.reload
      assert_equal 'DEF-5678', veiculo.placa
      assert_equal 2, veiculo.idrota
      assert_equal 3, veiculo.idtransportadora
    end

    test 'test_destroy'
      veiculo = Veiculo.create(placa: 'ABC-1234', idrota: 1, idtransportadora: 2)
      assert_difference('Veiculo.count', -1) do
        delete :destroy, params: { id: veiculo.id }
      end
      assert_response :success
    end
    
    
    
    
    

  end