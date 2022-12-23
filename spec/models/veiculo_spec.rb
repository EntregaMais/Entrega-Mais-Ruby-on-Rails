require 'rails_helper'

RSpec.describe Veiculo, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe 'validation' do
    it 'cannot be created without a placa' do   #Teste para garantir que um veículo não possa ser criado sem uma placa"
      veiculo = Veiculo.new(idrota: 1, idtransportadora: 2)
      expect(veiculo).not_to be_valid
    end

    it 'cannot be created without an idrota' do #Teste para garantir que um veículo não possa ser criado sem uma rota
      veiculo = Veiculo.new(placa: 'ABC-1234', idtransportadora: 2)
      expect(veiculo).not_to be_valid
    end

    it 'cannot be created without an idtransportadora' do
      veiculo = Veiculo.new(placa: 'ABC-1234', idrota: 1)
      expect(veiculo).not_to be_valid
    end

    it 'must have a unique placa' do
      Veiculo.create(placa: 'ABC-1234', idrota: 1, idtransportadora: 2)
      veiculo = Veiculo.new(placa: 'ABC-1234', idrota: 1, idtransportadora: 3)
      expect(veiculo).not_to be_valid
    end

    it 'can be created with all valid attributes' do
      veiculo = Veiculo.new(placa: 'ABC-1234', idrota: 1, idtransportadora: 2)
      expect(veiculo).to be_valid
    end

    it 'can be created with a placa of up to 7 characters' do #Teste para garantir que um veículo possa ser criado com uma placa com até 7 caracteres
      veiculo = Veiculo.new(placa: 'ABC-123', idrota: 1, idtransportadora: 2)
      expect(veiculo).to be_valid
    end

    it 'can only be created with an existing idrota' do #Teste para garantir que um veículo só possa ser criado com uma rota existente
      rota = Rota.create(nome: 'Rota A')
      veiculo = Veiculo.new(placa: 'ABC-1234', idrota: rota.id, idtransportadora: 2)
      expect(veiculo).to be_valid
      veiculo.idrota = rota.id + 1
      expect(veiculo).not_to be_valid
    end

    it "placa deve ser obrigatória, única e ter entre 6 e 15 caracteres" do
      veiculo = Veiculo.new(placa: nil)
      expect(veiculo).to be_invalid
      expect(veiculo.errors[:placa]).to be_present

      veiculo.placa = "a" * 5
      expect(veiculo).to be_invalid
      expect(veiculo.errors[:placa]).to be_present

      veiculo.placa = "a" * 16
      expect(veiculo).to be_invalid
      expect(veiculo.errors[:placa]).to be_present

      veiculo.placa = "a" * 6
      expect(veiculo).to be_valid

      veiculo.save!
      veiculo2 = Veiculo.new(placa: "a" * 6)
      expect(veiculo2).to be_invalid
      expect(veiculo2.errors[:placa]).to be_present
    end


    it "idrota deve ser obrigatória e numérica" do
      veiculo = Veiculo.new(idrota: nil)
      expect(veiculo).to be_invalid
      expect(veiculo.errors[:idrota]).to be_present

      veiculo.idrota = "abc"
      expect(veiculo).to be_invalid
      expect(veiculo.errors[:idrota]).to be_present

      veiculo.idrota = 123
      expect(veiculo).to be_valid
    end

    it "idtransportadora deve ser obrigatória e numérica" do
      veiculo = Veiculo.new(idtransportadora: nil)
      expect(veiculo).to be_invalid
      expect(veiculo.errors[:idtransportadora]).to be_present

      veiculo.idtransportadora = "abc"
      expect(veiculo).to be_invalid
      expect(veiculo.errors[:idtransportadora]).to be_present

      veiculo.idtransportadora = 123
      expect(veiculo).to be_valid
    end
  end


  end

  describe '.find_by_placa' do
    it 'can only be created with an existing idtransportadora' do #Teste para garantir que um veículo só possa ser criado com uma transportadora existente
      transportadora = Transportadora.create(nome: 'Transportadora A')
      veiculo = Veiculo.new(placa: 'ABC-1234', idrota: 1, idtransportadora: transportadora.id)
      expect(veiculo).to be_valid
      veiculo.idtransportadora = transportadora.id + 1
      expect(veiculo).not_to be_valid
    end
  end

  describe '.find_by_placa' do
    it 'returns a veiculo with the specified placa' do #Teste para garantir que o método de classe find_by_placa retorne um veículo com a placa especificada
      Veiculo.create(placa: 'ABC-1234', idrota: 1, idtransportadora: 2)
      veiculo = Veiculo.find_by_placa('ABC-1234')
      expect(veiculo).to be_a(Veiculo)
      expect(veiculo.placa).to eq 'ABC-1234'
    end
  end

  describe '.find_by_idrota' do
    it 'returns all veiculos with the specified idrota' do
      rota = Rota.create(nome: 'Rota A')
      Veiculo.create(placa: 'ABC-1234', idrota: rota.id, idtransportadora: 2)
      Veiculo.create(placa: 'DEF-5678', idrota: rota.id, idtransportadora: 3)
      Veiculo.create(placa: 'GHI-9101', idrota: rota.id + 1, idtransportadora: 4)
      veiculos = Veiculo.find_by_idrota(rota.id)
      expect(veiculos).to be_a(Array)
      expect(veiculos.length).to eq 2
      veiculos.each do |veiculo|
        expect(veiculo).to be_a(Veiculo)
        expect(veiculo.idrota).to eq rota.id
      end
    end
  end

  describe '.find_by_idtransportadora' do
    #Teste para garantir que o método de classe find_by_idtransportadora retorne todos os veículos com a transportadora especificada
    it 'returns all veiculos with the specified idtransportadora' do
      transportadora = Transportadora.create(nome: 'Transportadora A')
      Veiculo.create(placa: 'ABC-1234', idrota: 1, idtransportadora: transportadora.id)
      Veiculo.create(placa: 'DEF-5678', idrota: 2, idtransportadora: transportadora.id)
      Veiculo.create(placa: 'GHI-9101', idrota: 3, idtransportadora: transportadora.id + 1)
      veiculos = Veiculo.find_by_idtransportadora(transportadora.id)
      expect(veiculos).to be_a(Array)
      expect(veiculos.length).to eq 2
      veiculos.each do |veiculo|
        expect(veiculo).to be_a(Veiculo)
        expect(veiculo.idtransportadora).to eq transportadora.id
      end
    end
  end

  describe '.all' do
    #Teste para garantir que o método de classe all retorne todos os veículos existentes
    it 'returns all veiculos' do
      Veiculo.create(placa: 'ABC-1234', idrota: 1, idtransportadora: 2)
      Veiculo.create(placa: 'DEF-5678', idrota: 2, idtransportadora: 3)
      Veiculo.create(placa: 'GHI-9101', idrota: 3, idtransportadora: 4)
      veiculos = Veiculo.all
      expect(veiculos).to be_a(Array)
      expect(veiculos.length).to eq 3
      veiculos.each do |veiculo|
        expect(veiculo).to be_a(Veiculo)
      end
    end
  end

  describe '#destroy' do
    it 'deletes a veiculo from the database' do
      veiculo = Veiculo.create(placa: 'ABC-1234', idrota: 1, idtransportadora: 2)
      expect { veiculo.destroy }.to change { Veiculo.count }.by(-1)
    end
  end

  describe '#update' do
    it 'updates the attributes of a veiculo in the database' do
      veiculo = Veiculo.create(placa: 'ABC-1234', idrota: 1, idtransportadora: 2)
      veiculo.update(placa: 'DEF-5678', idrota: 2, idtransportadora: 3)
      veiculo.reload
      expect(veiculo.placa).to eq 'DEF-5678'
      expect(veiculo.idrota).to eq 2
      expect(veiculo.idtransportadora).to eq 3
    end
  end
  
end
  


  

end
