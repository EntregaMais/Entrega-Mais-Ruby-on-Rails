class CreatePolis < ActiveRecord::Migration[5.2]
  def change
    create_table :polis do |t|
      t.integer :idapi
      t.string :nmcidade
      t.integer :idtrajeto

      t.timestamps
    end
  end
end
