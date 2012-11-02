class CreateMumbles < ActiveRecord::Migration
  def change
    create_table :mumbles do |t|
      t.text :string_a
      t.text :string_b

      t.timestamps
    end
  end
end
