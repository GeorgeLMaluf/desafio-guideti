class CreateAtivos < ActiveRecord::Migration[6.1]
  def change
    create_table :ativos do |t|
      t.string :name, null:false
      t.date   :data, null: false
      t.float  :value, null:false, defaults: 0
      t.timestamps
    end
  end
end
