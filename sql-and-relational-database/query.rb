require 'sqlite3'

db = SQLite3::Database.new('db/patients_doctors.sqlite')

query = <<-SQL
  select * from doctors
  where first_name = 'Rosalind'
SQL

rows = db.execute(query)

pp rows
