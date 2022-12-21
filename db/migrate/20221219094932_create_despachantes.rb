class CreateDespachantes < ActiveRecord::Migration[5.2]
  def change
    create_table :despachantes do |t|
      t.string :nmdespachante
      t.integer :idtransportadora

      t.timestamps
    end
  end
end
