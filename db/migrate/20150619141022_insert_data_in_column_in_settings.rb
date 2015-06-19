class InsertDataInColumnInSettings < ActiveRecord::Migration
	
  def up
  	execute "INSERT INTO settings (name, value) VALUES ('Automatic activation', 'on')"
  end

  def down
  	execute "DELETE FROM settings WHERE name = 'Automatic activation'"
  end

end
