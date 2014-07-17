require "httpclient"
require "onsip/version"
require "onsip/session"

module Onsip
  # Your code goes here...

  module Actions
    BASE = "https://api.onsip.com/api"
    ECHO = BASE + "?Action=Echo&Foo=Bar" 
  end
end
