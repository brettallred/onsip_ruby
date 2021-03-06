require "httpclient"
require "json"
require "active_support"
require 'active_support/core_ext'
require "onsip/remote_resource"
require "onsip/session"
require "onsip/call_detail_record"
require "onsip/user"
require "onsip/version"

module Onsip
  # Your code goes here...

  RESPONSE_SCHEMA_FILE_PATH = File.dirname(__FILE__) + "/junction_networks_response_schema.rng"

  module Actions
    BASE = "https://api.onsip.com/api"
  end
end
