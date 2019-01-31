class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.text :content
      t.text :picture
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
