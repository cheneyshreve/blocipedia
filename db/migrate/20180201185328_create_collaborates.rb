class CreateCollaborates < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborates do |t|
      t.references :user, index: true, foreign_key: true
      t.references :wiki, index: true, foreign_key: true

      t.timestamps
    end
  end
end
