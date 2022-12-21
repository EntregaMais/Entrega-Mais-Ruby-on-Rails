require 'test_helper'

class PoliTest < ActiveSupport::TestCase
    test "should not save poli without idapi" do
        poli = Poli.new(nmcidade: 'São Paulo', idtrajeto: 1)
        assert_not poli.save
    end

    test "should not save poli with idapi less than 1" do
        poli = Poli.new(idapi: 0, nmcidade: 'São Paulo', idtrajeto: 1)
        assert_not poli.save
    end

    test "should not save poli without nmcidade" do
        poli = Poli.new(idapi: 1, idtrajeto: 1)
        assert_not poli.save
    end

    test "should not save poli with nmcidade shorter than 3 characters" do
        poli = Poli.new(idapi: 1, nmcidade: 'SP', idtrajeto: 1)
        assert_not poli.save
    end

    test "should not save poli without idtrajeto" do
        poli = Poli.new(idapi: 1, nmcidade: 'São Paulo')
        assert_not poli.save
    end

    test "should not save poli with idtrajeto less than 1" do
        poli = Poli.new(idapi: 1, nmcidade: 'São Paulo', idtrajeto: 0)
        assert_not poli.save
    end
end