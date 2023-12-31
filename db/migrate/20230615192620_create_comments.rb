class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
