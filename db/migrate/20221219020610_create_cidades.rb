class CreateCidades < ActiveRecord::Migration[5.2]
  def change
    create_table :cidades do |t|
      t.integer :id
      t.string :nmcidade
      t.integer :idtrajeto

      t.timestamps
    end
  end
end
