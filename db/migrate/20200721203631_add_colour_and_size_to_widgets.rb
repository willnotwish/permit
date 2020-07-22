class AddColourAndSizeToWidgets < ActiveRecord::Migration[5.0]
  def change
    add_reference :widgets, :colour, foreign_key: true
    add_reference :widgets, :size, foreign_key: true
  end
end
