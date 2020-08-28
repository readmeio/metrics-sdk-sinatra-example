require "sinatra"
require "sinatra/json"

get "/hello" do
  "hello"
end

get "/api/users" do
  json [ { name: "John Doe", age: 42 } ]
end

post "/api/users" do
  204
end
