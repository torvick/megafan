class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :answer
      t.boolean :correct
      t.string :type_answer
      t.belongs_to :language
      t.belongs_to :question
      t.timestamps
    end
  end
end
