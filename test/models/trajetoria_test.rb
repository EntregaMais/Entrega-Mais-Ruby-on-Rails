require 'test_helper'

class TrajetoTest < ActiveSupport::TestCase
  def setup
    @trajeto = Trajeto.new(nmtrajeto: 'Trajeto A', dstrajeto: 'De São Paulo para Rio de Janeiro', idtransportadora: 1)
  end

  test "should be valid" do
    assert @trajeto.valid?
  end

  test "nmtrajeto should be present" do
    @trajeto.nmtrajeto = ""
    assert_not @trajeto.valid?
  end

  test "dstrajeto should be present" do
    @trajeto.dstrajeto = ""
    assert_not @trajeto.valid?
  end

  test "idtransportadora should be present" do
    @trajeto.idtransportadora = ""
    assert_not @trajeto.valid?
  end
end
