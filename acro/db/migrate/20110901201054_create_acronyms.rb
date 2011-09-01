class CreateAcronyms < ActiveRecord::Migration
  def change
    create_table :acronyms do |t|
      t.string :letters
      t.string :definition

      t.timestamps
    end
  end
end
