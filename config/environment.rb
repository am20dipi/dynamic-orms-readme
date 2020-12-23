require 'sqlite3'


DB = {:conn => SQLite3::Database.new("db/songs.db")}
DB[:conn].execute("DROP TABLE IF EXISTS songs")

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS songs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  album TEXT
  )
SQL

DB[:conn].execute(sql)
DB[:conn].results_as_hash = true

#Here we are (1) creating the database, (2) dropping table songs to avoid an error, (3) creating the songs table.

#The results_as_hash method is available to use from the SQLite3 - Ruby gem; it ensures that when a select statement is executed, it returns the database row as a hash with the column names as keys. 
