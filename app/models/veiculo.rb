class Veiculo < ApplicationRecord
    validates :placa, presence:true, uniqueness: { case_sensitive: false }, length: { in: 6 .. 15}
    validates :idrota, presence:true, numericality: { only_integer: true}
    validates :idtransportadora, presence:true, numericality: { only_integer: true}
end
