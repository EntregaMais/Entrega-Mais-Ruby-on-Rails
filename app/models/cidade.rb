class Cidade < ApplicationRecord
	belongs_to :trajeto
    accepts_nested_attributes_for :trajeto, allow_destroy: true
end
