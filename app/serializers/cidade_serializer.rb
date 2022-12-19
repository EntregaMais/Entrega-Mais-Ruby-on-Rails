class CidadeSerializer < ActiveModel::Serializer
  attributes :id, :idapi, :nmcidade, :idtrajeto, :trajeto, :references
end
