class CreateShortenedurls < ActiveRecord::Migration
  def change
    create_table :shortenedurls do |t|
    	t.string :url
    	t.string :short_url
    	t.integer :clicks_num
      t.timestamps null: false
    end
  end
end
