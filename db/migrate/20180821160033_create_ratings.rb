class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.references :article, foreign_key: true
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
