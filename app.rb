require "sinatra"
require "sinatra/json"
require "rack/auth/basic"
require "dotenv/load"

use Rack::Auth::Basic do |username, password|
  username == ENV.fetch("USERNAME") && password == ENV.fetch("PASSWORD")
end

get "/hello" do
  "hello"
end

get "/api/users" do
  json [ { name: "John Doe", age: 42 } ]
end

post "/api/users" do
  204
end
