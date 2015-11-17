if development?
  set :database, {
    adapter: "sqlite3",
    database: "db/db.sqlite3"
  }
else
  set :database, ENV['DATABASE_URL']
end