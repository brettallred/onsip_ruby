require "httpclient"
require "nokogiri"
require "json"
require "onsip/version"
require "onsip/session"

module Onsip
  # Your code goes here...

  RESPONSE_SCHEMA_FILE_PATH = File.dirname(__FILE__) + "/junction_networks_response_schema.rng"

  module Actions
    BASE = "https://api.onsip.com/api"
  end
end
