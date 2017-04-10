require "../spec_helper"

describe HTTP::Dummy do
  # You can use get,post,put,patch,delete to call the corresponding route.
  it "renders /" do
    get "/"
    response.body.should eq "Hello, world!"
  end

  it "returns default_response" do
    get "/"

    response.status_code.should eq(200)
    response.body.should eq("Hello, world!")
  end

  HTTP::Dummy::STATUSES.each do |code, content|
    it "responds to #{code} HTTP status code" do
      get "/code/#{code}"

      response.status_code.should eq(code)
      response.body.should eq(content)
    end
  end

  it "returns slow_response" do
    get "/slow"

    response.status_code.should eq(200)
    response.body.should contain("Hello, tired!")
  end

  it "redirects indefinitely" do
    get "/redirection/infinite"

    response.status_code.should eq(302)
    response.headers["Location"].should eq("/redirection/infinite")
  end

  it "redirects to a local URL" do
    get "/redirection/local"

    response.status_code.should eq(302)
    response.headers["Location"].should eq("/html")
  end

  it "redirects temporarily" do
    get "/redirection/temporary"

    response.status_code.should eq(301)
    response.headers["Location"].should eq("/html")
  end

  it "redirects to another domain" do
    get "/redirection/other_domain"

    response.status_code.should eq(302)
    response.headers["Location"].should eq("https://www.google.com")
  end

  it "returns xml" do
    get "/xml"

    response.status_code.should eq(200)
    response.body.should eq(HTTP::Dummy::Sample::XML)
  end

  it "returns html" do
    get "/html"

    response.status_code.should eq(200)
    response.body.should eq(HTTP::Dummy::Sample::HTML)
  end

  it "returns json" do
    get "/json"

    response.status_code.should eq(200)
    response.body.should eq(HTTP::Dummy::Sample::JSON)
  end

  it "returns text" do
    get "/text"

    response.status_code.should eq(200)
    response.body.should eq(HTTP::Dummy::Sample::TEXT)
  end
end
