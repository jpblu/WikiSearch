class CreateText2Find < ActiveRecord::Migration[6.1]
  def change
    create_table :text2find do |t|

      t.string :word2find
      t.integer :wfcount

      t.timestamps
    end
  end
end
