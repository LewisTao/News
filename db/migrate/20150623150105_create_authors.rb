class CreateAuthors < ActiveRecord::Migration
  def change
  	enable_extension 'uuid-ossp'

    create_table :authors, id: :uuid do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end

    add_index :authors, :email, unique: true
  end
end
