class Despachante < ApplicationRecord

    validates :nmdespachante, length: { in: 3..150 }
    validates :idtransportadora, numericality: { only_integer: true}
end
