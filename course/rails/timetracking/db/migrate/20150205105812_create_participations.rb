class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
    	t.integer :person, index: true
    	t.integer :project, index: true
      t.timestamps null: false
    end
  end
end
