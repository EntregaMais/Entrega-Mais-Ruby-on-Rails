class Despachante < ApplicationRecord

    validates :nmdespachante
    validates :idtransportadora, numericality: { only_integer: true}
end
