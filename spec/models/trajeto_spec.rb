require 'rails_helper'

RSpec.describe Trajeto, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "nmtrajeto deve ser obrigatório e único" do
    trajeto = Trajeto.new(nmtrajeto: nil, idtransportadora: 1, dstrajeto: "aaa")
    expect(trajeto).to be_invalid
    expect(trajeto.errors[:nmtrajeto]).to be_present

    trajeto.nmtrajeto = "Trajeto Teste"
    expect(trajeto).to be_valid

    trajeto.save!
    trajeto2 = Trajeto.new(nmtrajeto: "Trajeto Teste", idtransportadora: 1, dstrajeto: "aaa")
    expect(trajeto2).to be_invalid
    expect(trajeto2.errors[:nmtrajeto]).to be_present
  end

  it "dstrajeto deve ser obrigatória" do
    trajeto = Trajeto.new(dstrajeto: nil, nmtrajeto: "Trajeto Teste", idtransportadora: 1)
    expect(trajeto).to be_invalid
    expect(trajeto.errors[:dstrajeto]).to be_present

    trajeto.dstrajeto = "São Paulo - Rio de Janeiro"
    expect(trajeto).to be_valid
  end

  it "idtransportadora deve ser obrigatória e numérica" do
    trajeto = Trajeto.new(idtransportadora: nil, nmtrajeto: "Trajeto Teste", dstrajeto: "aaa")
    expect(trajeto).to be_invalid
    expect(trajeto.errors[:idtransportadora]).to be_present
    trajeto.idtransportadora = "abc"
    expect(trajeto).to be_invalid
    expect(trajeto.errors[:idtransportadora]).to be_present

    trajeto.idtransportadora = 123
    expect(trajeto).to be_valid
  end


  # Testa se o Trajeto é válido com atributos válidos
  it 'é válido com atributos válidos' do #testando se um novo Trajeto é válido quando criado com atributos válidos
    trajeto = Trajeto.new(
      nmtrajeto: 'Trajeto A',
      dstrajeto: 'Descrição do trajeto A',
      idtransportadora: 1
    )
    expect(trajeto).to be_valid
  end

  # Testa se o Trajeto é inválido sem um nome
  it 'é inválido sem um nome' do #testando se um novo Trajeto é inválido quando criado sem um nome ou sem uma descrição, respectivamente
    trajeto = Trajeto.new(nmtrajeto: nil, dstrajeto: "aaa", idtransportadora: 2)
    trajeto.valid?
    expect(trajeto.errors[:nmtrajeto]).to include("can't be blank")
  end

  # Testa se o Trajeto é inválido sem uma descrição
  it 'é inválido sem uma descrição' do
    trajeto = Trajeto.new(dstrajeto: nil, nmtrajeto: "Trajeto Teste", idtransportadora: 1)
    trajeto.valid?
    expect(trajeto.errors[:dstrajeto]).to include("can't be blank")
  end

  # Testa se o Trajeto é inválido sem um ID de transportadora
  it 'é inválido sem um ID de transportadora' do #testando se um novo Trajeto é inválido quando criado sem um ID de transportadora
    trajeto = Trajeto.new(idtransportadora: nil, nmtrajeto: "Trajeto Teste", dstrajeto: "aaa")
    trajeto.valid?
    expect(trajeto.errors[:idtransportadora]).to include("can't be blank")
  end

  # Testa se o nome do Trajeto é único
  it 'tem um nome único' do #testando se o nome de um Trajeto é único. Para isso, criamos um Trajeto com um nome específico e, em seguida, tentamos criar outro Trajeto com o mesmo nome. O teste verifica se o segundo Trajeto é inválido porque o nome já foi tomado.
    Trajeto.create(
      nmtrajeto: 'Trajeto A',
      dstrajeto: 'Descrição do trajeto A',
      idtransportadora: 1
    )
    trajeto_duplicado = Trajeto.new(
      nmtrajeto: 'Trajeto A',
      dstrajeto: 'Descrição do trajeto A',
      idtransportadora: 1
    )
    trajeto_duplicado.valid?
    expect(trajeto_duplicado.errors[:nmtrajeto]).to include('has already been taken')
  end

  # Testa o tamanho máximo do nome do Trajeto
  it 'tem um nome com no máximo 50 caracteres' do #testando se o nome de um Trajeto não pode ter mais do que 50 caracteres. Para isso, criamos um Trajeto com um nome de 51 caracteres e verificamos se ele é inválido.
    trajeto = Trajeto.new(nmtrajeto: 'a' * 51, idtransportadora: 1, dstrajeto: "aaa")
    trajeto.valid?
    expect(trajeto.errors[:nmtrajeto]).to include('is too long (maximum is 50 characters)')
  end

  # Testa o tamanho máximo da descrição do Trajeto
  it 'tem uma descrição com no máximo 250 caracteres' do #testando se a descrição de um Trajeto não pode ter mais do que 250 caracteres. Para isso, criamos um Trajeto com uma descrição de 251 caracteres e verificamos se ele é inválido
    trajeto = Trajeto.new(dstrajeto: 'a' * 251, nmtrajeto: "Trajeto Teste", idtransportadora: 1)
    trajeto.valid?
    expect(trajeto.errors[:dstrajeto]).to include('is too long (maximum is 250 characters)')
  end

    # Testa o método de busca por nome do Trajeto
  it 'responde ao método de busca por nome' do #testando o método de busca por nome do Trajeto. Criamos um Trajeto com um nome específico e verificamos se o método find_by_nmtrajeto retorna um resultado para esse nome
    Trajeto.create(
      nmtrajeto: 'Trajeto A',
      dstrajeto: 'Descrição do trajeto A',
      idtransportadora: 1
    )
    expect(Trajeto.find_by_nmtrajeto('Trajeto A')).not_to be_nil
  end

  # Testa o método de busca por ID da Transportadora do Trajeto
  it 'responde ao método de busca por ID da Transportadora' do # testando o método de busca por ID da transportadora do Trajeto. Criamos um Trajeto com um ID de transportadora específico e verificamos se o método find_by_idtransportadora retorna um resultado para esse ID
    Trajeto.create(
      nmtrajeto: 'Trajeto A',
      dstrajeto: 'Descrição do trajeto A',
      idtransportadora: 1
    )
    expect(Trajeto.find_by_idtransportadora(1)).not_to be_nil
  end

  # Testa o método de exclusão do Trajeto
  it 'responde ao método de exclusão' do #testando o método de exclusão do Trajeto. Criamos um Trajeto e o excluímos com o método destroy. Em seguida, verificamos se o método find_by_id não retorna um resultado para o ID do Trajeto excluído
    trajeto = Trajeto.create(
      nmtrajeto: 'Trajeto A',
      dstrajeto: 'Descrição do trajeto A',
      idtransportadora: 1
    )
    trajeto.destroy
    expect(Trajeto.find_by_id(trajeto.id)).to be_nil
  end

end
