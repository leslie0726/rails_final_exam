class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :department
      t.string :grade
      t.string :name
      t.string :sex
      t.string :position
      t.text :reason
      t.text :politics
      t.integer :votes,default: 0

      t.timestamps
    end
  end
end
