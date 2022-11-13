class AddUniqueIndexToAtivos < ActiveRecord::Migration[6.1]
  def change
    add_index :ativos, [:name, :data], unique: true
  end
end
