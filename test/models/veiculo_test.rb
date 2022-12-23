

class VeiculoTest < ActiveSupport::TestCase
    
  

  test 'should not save veiculo without placa' do
    veiculo = Veiculo.new
    assert_not veiculo.save, 'Saved veiculo without placa'
  end

  test 'should not save veiculo without idrota' do
    veiculo = Veiculo.new(placa: 'ABC-1234')
    assert_not veiculo.save, 'Saved veiculo without idrota'
  end

  test 'should not save veiculo without idtransportadora' do
    veiculo = Veiculo.new(placa: 'ABC-1234', idrota: 1)
    assert_not veiculo.save, 'Saved veiculo without idtransportadora'
  end

  test 'should save veiculo with placa, idrota and idtransportadora' do
    veiculo = Veiculo.new(placa: 'ABC-1234', idrota: 1, idtransportadora: 1)
    assert veiculo.save, 'Failed to save veiculo with placa, idrota and idtransportadora'
  end

  test 'should not save veiculo with duplicate placa' do
    veiculo1 = Veiculo.new(placa: 'ABC-1234', idrota: 1, idtransportadora: 1)
    veiculo1.save
    veiculo2 = Veiculo.new(placa: 'ABC-1234', idrota: 2, idtransportadora: 2)
    assert_not veiculo2.save, 'Saved veiculo with duplicate placa'
  end

  test 'Teste para verificar se a tabela de veículos foi criada corretamente:' do
      assert_equal true, ActiveRecord::Base.connection.table_exists?(:veiculos)
  end
    
  test 'Teste para verificar se a coluna "placa" foi criada como uma string' do
      assert_equal :string, Veiculo.columns_hash['placa'].type
  end

  test 'Teste para verificar se a coluna "idrota" foi criada como um inteiro' do
      assert_equal :integer, Veiculo.columns_hash['idrota'].type
  end

  test 'Teste para verificar se a coluna "idtransportadora" foi criada como um inteiro' do
      assert_equal :integer, Veiculo.columns_hash['idtransportadora'].type
  end

  test 'Teste para verificar se a coluna "placa" é única' do
      assert_equal true, Veiculo.columns_hash['placa'].unique
  end

  test 'test_veiculo_must_have_idrota'
    veiculo = Veiculo.new(placa: 'ABC-1234', idtransportadora: 2)
    assert_not veiculo.save
  end

  test 'test_veiculo_must_have_idtransportadora'
    veiculo = Veiculo.new(placa: 'ABC-1234', idrota: 1)
    assert_not veiculo.save
  end

  test 'test_veiculo_placa_uniqueness'
    Veiculo.create(placa: 'ABC-1234', idrota: 1, idtransportadora: 2)
    veiculo = Veiculo.new(placa: 'ABC-1234', idrota: 1, idtransportadora: 3)
    assert_not veiculo.save
  end

  test 'test_veiculo_creation_with_valid_attributes'
    veiculo = Veiculo.new(placa: 'ABC-1234', idrota: 1, idtransportadora: 2)
    assert veiculo.save
  end
  
  


  
    
  end