class Trajeto < ApplicationRecord

    validates :nmtrajeto, presence: true, uniqueness: { case_sensitive: true }, length: { in: 1..50 }
    validates :dstrajeto, presence:true, length: { in: 1..250 }
    validates :idtransportadora, presence:true, numericality: { only_integer: true}
end
