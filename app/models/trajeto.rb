class Trajeto < ApplicationRecord

    validates :nmtrajeto, presence: true, uniqueness: { case_sensitive: true }
    validates :dstrajeto, presence:true
    validates :idtransportadora, presence:true, numericality: { only_integer: true}
end
