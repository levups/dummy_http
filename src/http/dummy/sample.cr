module HTTP
  module Dummy
    module Sample
      TEXT = <<-HEREDOC
        Stand up for what you believe in, even if it means standing alone.
        — Andy Biersack
      HEREDOC

      XML = <<-HEREDOC
      <?xml version="1.0" encoding="UTF-8" standalone="no"?>
      <message>
        <from>Alice</from>
        <to>Bob</to>
        <body>Hello</body>
      </message>
      HEREDOC

      HTML = <<-HEREDOC
      <!doctype html>
      <html lang="en">
      <head><meta charset="utf-8"><title>Hi</title></head>
      <body><p>Hello World !</p></body>
      </html>
      HEREDOC

      JSON = { life: 42, foo: "bar", false: true, pi: 13.37 }.to_json    
    end
  end
end