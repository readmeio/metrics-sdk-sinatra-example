require "dotenv/load"
require "rack/auth/basic"
require "readme/metrics"
require "sinatra"
require "sinatra/json"

use Rack::Auth::Basic do |username, password|
  username == ENV.fetch("USERNAME") && password == ENV.fetch("PASSWORD")
end

use Readme::Metrics, buffer_length: 1, reject_params: ["Authorization"], api_key: ENV.fetch("README_API_KEY") do
  { id: ENV.fetch("USERNAME"),
    label: ENV.fetch("USERNAME"),
    email: "user@example.com"
  }
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
