class AddCreatedByToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :created_by, :string
  end
end
