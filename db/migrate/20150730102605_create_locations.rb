class CreateLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|

    	t.string "name"
    	t.string "ip", :default => @myip
    	t.string "lat"
    	t.string "lon"
    	t.integer "position", :default => @location_count

      t.timestamps
    end
  end

  def down
  	drop_table :locations
  end

end
