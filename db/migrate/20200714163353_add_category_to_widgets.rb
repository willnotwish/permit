class AddCategoryToWidgets < ActiveRecord::Migration[5.0]
  def change
    add_reference :widgets, :category, foreign_key: true
  end
end
