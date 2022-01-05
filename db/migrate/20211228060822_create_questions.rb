class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :answer_corrects
      t.belongs_to :language
      t.belongs_to :trivium
      t.timestamps
    end
  end
end
