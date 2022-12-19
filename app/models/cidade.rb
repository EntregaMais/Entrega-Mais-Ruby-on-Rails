class Cidade < ApplicationRecord
	belongs_to :trajeto
    accepts_nested_attributes_for :contatos, 
        reject_if :all_blank, 
        allow_destroy :true
end
