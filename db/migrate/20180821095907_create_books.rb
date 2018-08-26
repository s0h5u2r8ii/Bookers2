class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :opinion
      t.string :name
      t.text :introduction

      t.timestamps
  end
end
