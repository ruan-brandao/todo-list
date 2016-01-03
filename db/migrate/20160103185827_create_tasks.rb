class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :text
      t.boolean :done, default: false
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
