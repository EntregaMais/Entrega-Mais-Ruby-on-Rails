class DespachanteTest < ActiveSupport::TestCase
  test "nmdespachante deve ser obrigatório" do
    despachante = Despachante.new
    assert_not despachante.valid?
    assert_includes despachante.errors.keys, :nmdespachante
  end

  test "idtransportadora deve ser numérico" do
    despachante = Despachante.new(idtransportadora: "abc")
    assert_not despachante.valid?
    assert_includes despachante.errors.keys, :idtransportadora
  end

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
  