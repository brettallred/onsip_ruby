require 'spec_helper'
require 'nokogiri'

describe Session do
  USERNAME = 'scp'
  PASSWORD = 'p7tfjFnKC9xHrjA'

  describe ".new" do
    # currently the new method has no behavior
  end

  describe "#authenticate" do
    it 'returns a session id' do
      session = Session.new
      session.authenticate(USERNAME, PASSWORD)
      expect(session.id).not_to be_nil
    end
  end

  describe "#echo" do
    it 'returns a session id' do
      session = Session.new
      expect(session.echo).to be_a(Hash)
    end

    it 'makes an http call to Onsip::Actions::ECHO' do
      sample_response_path = File.join(File.dirname(__FILE__), '..', 'sample_responses/' )
      sample_response_file =  File.open(sample_response_path + "echo.json", "rb")
      echo_response_message = HTTP::Message.new_response(sample_response_file.read)
      expect_any_instance_of(HTTPClient).to receive(:get).with(Onsip::Actions::BASE, { :Action => "Echo", :Output => "json" }).and_return(echo_response_message)
      session = Session.new
      session.echo
    end
  end

  describe "#destroy" do
    it '' do
      session = Session.new
      session.authenticate(USERNAME, PASSWORD)
      expect(session.destroy).to be_true
    end
  end

end
