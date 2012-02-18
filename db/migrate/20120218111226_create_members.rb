class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :github
      t.references :team

      t.timestamps
    end
    add_index :members, :team_id
  end
end
