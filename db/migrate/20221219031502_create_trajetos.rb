class CreateTrajetos < ActiveRecord::Migration[5.2]
  def change
    create_table :trajetos do |t|
      t.string :nmtrajeto
      t.string :dstrajeto
      t.integer :idtransportadora

      t.timestamps
    end
  end
end
