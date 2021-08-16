class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.date :dob
      t.text :biography

      t.timestamps
    end
  end
end
