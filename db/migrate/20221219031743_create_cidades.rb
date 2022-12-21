class CreateCidades < ActiveRecord::Migration[5.2]
  def change
    create_table :cidades do |t|
      t.integer :idapi
      t.string :nmcidade
      t.integer :idtrajeto
      t.string :trajeto
      t.string :references

      t.timestamps
    end
  end
end
