require "kemal"
require "json"
require "./dummy/*"

module HTTP::Dummy
  STATUSES.each do |code, message|
    next if code < 400
    error(code) do
      message
    end
  end

  get "/" do |env|
    "Hello, world!"
  end

  get "/code/:code" do |env|
    code = env.params.url["code"].to_i
    code = STATUSES.keys.includes?(code) ? code : 200

    env.response.status_code = code
    STATUSES[code]
  end

  get "/json" do |env|
    env.response.content_type = "application/json"
    Sample::JSON
  end

  get "/text" do |env|
    env.response.content_type = "text/plain"
    Sample::TEXT
  end

  get "/xml" do |env|
    env.response.content_type = "application/xml"
    Sample::XML
  end

  get "/html" do |env|
    env.response.content_type = "text/html"
    Sample::HTML
  end

  get "/slow" do |env|
    sleep 5
    "Hello, tired!"
  end

  get "/redirection/infinite" do |env|
    env.redirect "/redirection/infinite"
  end

  get "/redirection/local" do |env|
    env.redirect "/html"
  end

  get "/redirection/temporary" do |env|
    env.redirect "/html", 301
  end

  get "/redirection/other_domain" do |env|
    env.redirect "https://www.google.com"
  end
end

Kemal.run
