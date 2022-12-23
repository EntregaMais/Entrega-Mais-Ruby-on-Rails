require 'rails_helper'

RSpec.describe Despachante, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe '.all' do #Teste para garantir que o método de classe all retorne todos os despachantes existentes
    it 'returns all despachantes' do
      Despachante.create(nmdespachante: 'Despachante A', idtransportadora: 1)
      Despachante.create(nmdespachante: 'Despachante B', idtransportadora: 2)
      Despachante.create(nmdespachante: 'Despachante C', idtransportadora: 3)
      despachantes = Despachante.all
      expect(despachantes).to be_a(ActiveRecord::Relation)
      expect(despachantes.count).to eq 3
      despachantes.each do |despachante|
        expect(despachante).to be_a(Despachante)
      end
    end
  end

  describe '#destroy' do #Teste para garantir que o método de instância destroy exclua um despachante da base de dados
    it 'deletes a despachante from the database' do
      despachante = Despachante.create(nmdespachante: 'Despachante A', idtransportadora: 1)
      expect { despachante.destroy }.to change { Despachante.count }.by(-1)
    end

    it 'deletes a despachante from the database' do
      despachante = Despachante.create(nmdespachante: 'Despachante A', idtransportadora: 1)
      despachante.destroy
      expect(Despachante.exists?(despachante.id)).to be false
    end
  end

  describe '#update' do #Teste para garantir que o método de instância update atualize os atributos de um despachante na base de dados
    it 'updates the attributes of a despachante in the database' do
      despachante = Despachante.create(nmdespachante: 'Despachante A', idtransportadora: 1)
      despachante.update(nmdespachante: 'Despachante B', idtransportadora: 2)
      despachante.reload
      expect(despachante.nmdespachante).to eq 'Despachante B'
      expect(despachante.idtransportadora).to eq 2
    end
  end

  describe '.find_by_nmdespachante' do
    it 'returns the despachante with the specified name' do
      Despachante.create(nmdespachante: 'Despachante A', idtransportadora: 1)
      despachante = Despachante.find_by_nmdespachante('Despachante A')
      expect(despachante.nmdespachante).to eq 'Despachante A'
    end
  end

  describe '#save' do #Teste para garantir que o método de instância save salve um novo despachante na base de dados
    it 'saves a new despachante to the database' do
      despachante = Despachante.new(nmdespachante: 'Despachante A', idtransportadora: 1)
      expect { despachante.save }.to change { Despachante.count }.by(1)
    end
  end

  describe 'validation' do #Teste para garantir que um despachante não pode ser criado sem um idtransportadora
    it 'cannot be created without an idtransportadora' do
      despachante = Despachante.new(nmdespachante: 'Despachante A')
      expect(despachante).not_to be_valid
    end

    it 'cannot be created without an nmdespachante' do
      despachante = Despachante.new(idtransportadora: 1)
      expect(despachante).not_to be_valid
    end

    it 'not must have a unique nmdespachante' do #Teste para garantir que um despachante deve ter um nome único
      Despachante.create(nmdespachante: 'Despachante A', idtransportadora: 1)
      despachante = Despachante.new(nmdespachante: 'Despachante A', idtransportadora: 2)
      expect(despachante).to be_valid
    end

    it 'can be created with all valid attributes' do #Teste para garantir que um despachante pode ser criado com todos os atributos válidos
      despachante = Despachante.new(nmdespachante: 'Despachante A', idtransportadora: 1)
      expect(despachante).to be_valid
    end

    it "nmdespachante deve ser obrigatório" do
      despachante = Despachante.new
      expect(despachante).to be_invalid
      expect(despachante.errors[:nmdespachante]).to be_present
    end

    it "idtransportadora deve ser numérico" do
      despachante = Despachante.new(nmdespachante: "Despachante A", idtransportadora: "abc")
      expect(despachante).to be_invalid
      expect(despachante.errors[:idtransportadora]).to be_present
    
      despachante.idtransportadora = 123
      expect(despachante).to be_valid
    end

    it "nmdespachante deve ter entre 3 e 150 caracteres" do
      despachante = Despachante.new(nmdespachante: "ab", idtransportadora: 1)
      expect(despachante).to be_invalid
      expect(despachante.errors[:nmdespachante]).to be_present
    
      despachante.nmdespachante = "a" * 151
      expect(despachante).to be_invalid
      expect(despachante.errors[:nmdespachante]).to be_present
    
      despachante.nmdespachante = "a" * 3
      expect(despachante).to be_valid
    end

  end



end
