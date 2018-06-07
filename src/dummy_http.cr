require "kemal"
require "json"
require "./dummy_http/*"

module DummyHTTP
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
    env.response.content_type = "application/json;charset=utf-8"
    Sample::JSON
  end

  get "/text" do |env|
    env.response.content_type = "text/plain;charset=utf-8"
    Sample::TEXT
  end

  get "/xml" do |env|
    env.response.content_type = "application/xml;charset=utf-8"
    Sample::XML
  end

  # Charset is required in content type for PhantomJS or browsers to properly
  # detect encoding.
  #
  # Sample HTTP response headers for our previous Rails 5.1 app (http-tester)
  #
  # HTTP/1.1 200 OK
  # Date: Thu, 18 May 2017 04:33:17 GMT
  # Content-Type: text/html;charset=utf-8
  # X-Xss-Protection: 1; mode=block
  # X-Content-Type-Options: nosniff
  # X-Frame-Options: SAMEORIGIN
  # Content-Length: 128
  #
  # We should try to mimic those settings, as they seem to be sane.
  get "/html" do |env|
    env.response.content_type = "text/html;charset=utf-8"
    Sample::HTML
  end

  get "/slow" do |env|
    sleep 10
    "Hello, tired!"
  end

  get "/redirection/infinite" do |env|
    env.redirect "/redirection/infinite"
    "You are being redirected for ever and ever."
  end

  get "/redirection/local" do |env|
    env.redirect "/html"
    "You are being redirected to an HTML5 local page."
  end

  get "/redirection/temporary" do |env|
    env.redirect "/html", 301
    "You are being redirected temporarily."
  end

  get "/redirection/other_domain" do |env|
    env.redirect "https://www.google.com"
    "You are being redirected to Google.com permanently."
  end
end

Kemal.run
