require 'rails_helper'

RSpec.describe Despachante, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "validations" do
    it { should validate_presence_of(:nmdespachante) }
    it { should validate_presence_of(:idtransportadora) }
  end

end
