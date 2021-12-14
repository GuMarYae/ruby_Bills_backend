class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.string :title
      t.string :date
      t.string :string
      t.text :body
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
