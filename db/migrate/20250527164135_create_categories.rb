class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Category.reset_column_information
        Category.find_or_create_by!(name: "Работа")
        Category.find_or_create_by!(name: "Учёба")
        Category.find_or_create_by!(name: "Домашние дела")
      end
    end
  end
end
