require 'rails_helper'

RSpec.describe Poli, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "validações" do
    it "idapi deve ser obrigatório" do
      poli = Poli.new(idapi: nil)
      expect(poli).to be_invalid
      expect(poli.errors[:idapi]).to be_present

      poli.idapi = 123
      expect(poli).to be_valid
    end

    it "nmcidade deve ser obrigatória" do
      poli = Poli.new(nmcidade: nil)
      expect(poli).to be_invalid
      expect(poli.errors[:nmcidade]).to be_present

      poli.nmcidade = "São Paulo"
      expect(poli).to be_valid
    end

    it "idtrajeto deve ser obrigatório e numérico" do
      poli = Poli.new(idtrajeto: nil)
      expect(poli).to be_invalid
      expect(poli.errors[:idtrajeto]).to be_present

      poli.idtrajeto = "abc"
      expect(poli).to be_invalid
      expect(poli.errors[:idtrajeto]).to be_present

      poli.idtrajeto = 123
      expect(poli).to be_valid
    end
  end

  describe "validações" do #testa as validações do model, verificando se o model é inválido quando os campos obrigatórios são nulos.

    it "is invalid without a idapi" do
      poli = Poli.new(idapi: nil)
      poli.valid?
      expect(poli.errors[:idapi]).to include("can't be blank")
    end

    it "is invalid without a nmcidade" do 
      poli = Poli.new(nmcidade: nil)
      poli.valid?
      expect(poli.errors[:nmcidade]).to include("can't be blank")
    end

    it "is invalid without a idtrajeto" do 
      poli = Poli.new(idtrajeto: nil)
      poli.valid?
      expect(poli.errors[:idtrajeto]).to include("can't be blank")
    end

    it "é válido com atributos válidos" do
      poli = Poli.new(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1)
      expect(poli).to be_valid
    end
  end

  describe ".find_by_nmcidade" do
    it "returns the poli with the matching nmcidade" do #testa um método de classe personalizado que busca um registro de Poli baseado no valor de nmcidade
      poli1 = Poli.create!(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1)
      poli2 = Poli.create!(idapi: 2, nmcidade: "Rio de Janeiro", idtrajeto: 2)
      poli3 = Poli.create!(idapi: 3, nmcidade: "São Paulo", idtrajeto: 3)

      result = Poli.find_by_nmcidade("São Paulo")

      expect(result).to include(poli1, poli3)
      expect(result).not_to include(poli2)
    end
  end

  describe "#full_name" do #testa um método de instância personalizado que retorna o nome completo de um registro de Poli
    it "returns the full name of the poli" do
      poli = Poli.new(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1)

      expect(poli.full_name).to eq "São Paulo"
    end
  end

  describe ".most_recent" do # testa um método de classe personalizado que retorna os registros de Poli mais recentemente criados
    it "returns the most recently created polis" do
      poli1 = Poli.create!(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1)
      poli2 = Poli.create!(idapi: 2, nmcidade: "Rio de Janeiro", idtrajeto: 2)
      poli3 = Poli.create!(idapi: 3, nmcidade: "São Paulo", idtrajeto: 3)

      result = Poli.most_recent(2)

      expect(result).to eq [poli3, poli2]
    end
  end

  describe "#active?" do #testa um método de instância personalizado que verifica se um registro de Poli está ativo ou não, baseado no valor do campo active.
    it "returns true if the poli is active" do
      poli = Poli.new(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1, active: true)

      expect(poli.active?).to be true
    end

    it "returns false if the poli is not active" do
      poli = Poli.new(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1, active: false)

      expect(poli.active?).to be false
    end

    it "sets the active field to true" do #testa um método de instância personalizado que ativa um registro de Poli. Ele cria um novo registro de Poli com o campo active inicialmente definido como false, em seguida chama o método activate! e, finalmente, verifica se o valor do campo active foi alterado para true ao recarregar o registro do banco de dados.
      poli = Poli.create!(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1, active: false)
      poli.activate!
      poli.reload

      expect(poli.active).to be true
    end

    it "returns only the active polis" do #testa um método de classe personalizado que retorna apenas os registros de Poli ativos. Ele cria três registros de Poli com diferentes valores para o campo active, em seguida chama o método active e, finalmente, verifica se o método está retornando apenas os registros com o valor true para o campo active.
      poli1 = Poli.create!(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1, active: true)
      poli2 = Poli.create!(idapi: 2, nmcidade: "Rio de Janeiro", idtrajeto: 2, active: true)
      poli3 = Poli.create!(idapi: 3, nmcidade: "Belo Horizonte", idtrajeto: 3, active: false)

      result = Poli.active

      expect(result).to include(poli1, poli2)
      expect(result).not_to include(poli3)
    end
  end


  describe ".with_trajeto" do #testa um método de classe personalizado que retorna os registros de Poli com o valor de idtrajeto especificado. Ele verifica se o método está retornando os registros corretos e se está excluindo os registros que não devem ser incluídos
    it "returns the polis with the matching idtrajeto" do
      poli1 = Poli.create!(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1)
      poli2 = Poli.create!(idapi: 2, nmcidade: "Rio de Janeiro", idtrajeto: 2)
      poli3 = Poli.create!(idapi: 3, nmcidade: "São Paulo", idtrajeto: 1)

      result = Poli.with_trajeto(1)

      expect(result).to include(poli1, poli3)
      expect(result).not_to include(poli2)
    end
  end

  describe "#average_age" do #Testes para métodos de instância personalizados que realizam cálculos ou transformações nos dados do model, como por exemplo um método que calcula a idade média dos registros de Poli.
    it "returns the average age of the polis" do
      poli1 = Poli.create!(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1, age: 30)
      poli2 = Poli.create!(idapi: 2, nmcidade: "Rio de Janeiro", idtrajeto: 2, age: 25)
      poli3 = Poli.create!(idapi: 3, nmcidade: "Belo Horizonte", idtrajeto: 3, age: 35)

      result = poli1.average_age

      expect(result).to eq 30
    end
  end

  describe ".maximum_idapi" do #Testes para métodos de classe personalizados que realizam buscas ou agregações nos dados do model, como por exemplo um método que retorna o registro de Poli com o maior valor para o campo idapi
    it "returns the poli with the maximum idapi" do
      poli1 = Poli.create!(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1)
      poli2 = Poli.create!(idapi: 2, nmcidade: "Rio de Janeiro", idtrajeto: 2)
      poli3 = Poli.create!(idapi: 3, nmcidade: "Belo Horizonte", idtrajeto: 3)

      result = Poli.maximum_idapi

      expect(result).to eq poli3
    end
  end

end
