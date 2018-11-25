require 'sinatra'
require 'pg'

conn =
  PG.connect(
    dbname: 'sensei1',
    user: 'sensei',
    password: 'sensei',
    port: 5432,
    host: 'localhost'
  )

get '/' do
  conn.exec("UPDATE licznik SET ile = ile + 1")
  res = conn.exec("SELECT * FROM licznik")
  x = res.to_a.first['ile']
  x.to_s
end
