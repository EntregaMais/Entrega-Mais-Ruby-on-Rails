class DespachanteTest < ActiveSupport::TestCase
    test 'should not save despachante without nmdespachante' do
      despachante = Despachante.new
      assert_not despachante.save, 'Saved despachante without nmdespachante'
    end
  
    test 'should not save despachante without idtransportadora' do
      despachante = Despachante.new(nmdespachante: 'Despachante 1')
      assert_not despachante.save, 'Saved despachante without idtransportadora'
    end
  
    test 'should save despachante with nmdespachante and idtransportadora' do
      despachante = Despachante.new(nmdespachante: 'Despachante 1', idtransportadora: 1)
      assert despachante.save, 'Failed to save despachante with nmdespachante and idtransportadora'
    end
end
  