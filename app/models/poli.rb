class Poli < ApplicationRecord

    validates :idapi, presence: true
    validates :nmcidade, presence: true
    validates :idtrajeto, presence: true, numericality: { only_integer: true}
end
