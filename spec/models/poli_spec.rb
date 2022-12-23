require 'rails_helper'

RSpec.describe Poli, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "validações" do
    it "idapi deve ser obrigatório" do
      poli = Poli.new(idapi: nil, nmcidade: "Piracicaba", idtrajeto: 1)
      expect(poli).to be_invalid
      expect(poli.errors[:idapi]).to be_present

      poli.idapi = 123
      expect(poli).to be_valid
    end

    it "nmcidade deve ser obrigatória" do
      poli = Poli.new(nmcidade: nil, idapi: 1, idtrajeto: 1)
      expect(poli).to be_invalid
      expect(poli.errors[:nmcidade]).to be_present

      poli.nmcidade = "São Paulo"
      expect(poli).to be_valid
    end

    it "idtrajeto deve ser obrigatório e numérico" do
      poli = Poli.new(idtrajeto: nil, nmcidade: "Piracicaba", idapi: 1)
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
      poli = Poli.new(idapi: nil, nmcidade: "Piracicaba", idtrajeto: 1)
      poli.valid?
      expect(poli.errors[:idapi]).to include("can't be blank")
    end

    it "is invalid without a nmcidade" do 
      poli = Poli.new(nmcidade: nil, idapi: 1, idtrajeto: 1)
      poli.valid?
      expect(poli.errors[:nmcidade]).to include("can't be blank")
    end

    it "is invalid without a idtrajeto" do 
      poli = Poli.new(idtrajeto: nil, nmcidade: "Piracicaba", idapi: 1)
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

      result = Poli.where(nmcidade: "São Paulo")

      expect(result).to include(poli1, poli3)
      expect(result).not_to include(poli2)
    end
  end

  describe ".most_recent" do # testa um método de classe personalizado que retorna o registros de Poli mais recentemente criado
    it "returns the most recently created polis" do
      poli1 = Poli.create!(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1)
      poli2 = Poli.create!(idapi: 2, nmcidade: "Rio de Janeiro", idtrajeto: 2)
      poli3 = Poli.create!(idapi: 3, nmcidade: "São Paulo", idtrajeto: 3)

      result = Poli.order(created_at: :desc).limit(2)

      expect(result).to eq [poli3, poli2]
    end
  end


  describe ".with_trajeto" do #testa um método de classe personalizado que retorna os registros de Poli com o valor de idtrajeto especificado. Ele verifica se o método está retornando os registros corretos e se está excluindo os registros que não devem ser incluídos
    it "returns the polis with the matching idtrajeto" do
      poli1 = Poli.create!(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1)
      poli2 = Poli.create!(idapi: 2, nmcidade: "Rio de Janeiro", idtrajeto: 2)
      poli3 = Poli.create!(idapi: 3, nmcidade: "São Paulo", idtrajeto: 1)

      result = Poli.where(idtrajeto: 1)
      expect(result).to include(poli1, poli3)
      expect(result).not_to include(poli2)
    end
  end


  describe ".maximum_idapi" do #Testes para métodos de classe personalizados que realizam buscas ou agregações nos dados do model, como por exemplo um método que retorna o registro de Poli com o maior valor para o campo idapi
    it "returns the id poli with the maximum idapi" do
      poli1 = Poli.create!(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1)
      poli2 = Poli.create!(idapi: 2, nmcidade: "Rio de Janeiro", idtrajeto: 2)
      poli3 = Poli.create!(idapi: 3, nmcidade: "Belo Horizonte", idtrajeto: 3)

      result = Poli.maximum(:id)

      expect(result).to eq poli3.id
    end
  end

end
