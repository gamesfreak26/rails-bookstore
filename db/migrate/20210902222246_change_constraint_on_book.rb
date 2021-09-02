class ChangeConstraintOnBook < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :currency, :string, :null => true
  end
end
