class CreateVeiculos < ActiveRecord::Migration[5.2]
  def change
    create_table :veiculos do |t|
      t.string :placa, unique:true
      t.integer :idrota
      t.integer :idtransportadora

      t.timestamps
    end
  end
end
