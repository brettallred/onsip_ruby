require 'bundler/setup'

Bundler.setup

require 'onsip' # and any other gems you need




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
  # Limit the spec run to only specs with the focus metadata. If no specs have
  # the filtering metadata and `run_all_when_everything_filtered = true` then
  # all specs will run.
  #config.filter_run :focus

  # Run all specs when none match the provided filter. This works well in
  # conjunction with `config.filter_run :focus`, as it will run the entire
  # suite when no specs have `:filter` metadata.
  #config.run_all_when_everything_filtered = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  #config.order = 'random'

end

