require 'rails_helper'

RSpec.describe Trajeto, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "validations" do
    it { should validate_presence_of(:nmtrajeto) }
    it { should validate_presence_of(:dstrajeto) }
    it { should validate_presence_of(:idtransportadora) }
  end

end
