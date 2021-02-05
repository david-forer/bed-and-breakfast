class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :image
      t.string :desc
      t.decimal :price
      t.string :status

      t.timestamps
    end
  end
end
