require 'rails_helper'

RSpec.describe Poli, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "validações" do
    it "é válido com atributos válidos" do
      poli = Poli.new(idapi: 1, nmcidade: "São Paulo", idtrajeto: 1)
      expect(poli).to be_valid
    end

    it "é inválido sem idapi" do
      poli = Poli.new(idapi: nil)
    end
  end

  describe "validations" do
    it { should validate_presence_of(:idapi) }
    it { should validate_presence_of(:nmcidade) }
    it { should validate_presence_of(:idtrajeto) }
  end

end
