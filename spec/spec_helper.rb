require 'bundler/setup'
require 'onsip' 

Bundler.setup

module SpecHelper

  USERNAME = '-- INSERT ONSIP USERNAME --'
  PASSWORD = '-- INSERT ONSIP PASSWORD --'
  SAMPLE_RESPONSE_PATH = File.join(File.dirname(__FILE__), 'sample_responses/' )

  def read_file(filename)
    sample_response_file =  File.open(SAMPLE_RESPONSE_PATH + filename, "rb")
    return sample_response_file.read
  end

  def http_message_from_file(filename)
    sample_response = read_file(filename)
    HTTP::Message.new_response(sample_response)
  end

end

RSpec.configure do |config|
  config.include SpecHelper

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

end

