require 'spec_helper'

describe CallDetailRecord do
  USERNAME = 'scp'
  PASSWORD = 'p7tfjFnKC9xHrjA'
  SAMPLE_RESPONSE_PATH = File.join(File.dirname(__FILE__), '..', 'sample_responses/' )

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

    it 'makes external an http call to the Echo action' do
      json_response = http_message_from_file("echo.json")
      expect_any_instance_of(HTTPClient).to receive(:get).with(Onsip::Actions::BASE, { :Action => "Echo", :Output => "json" }).and_return(json_response)
      session = Session.new
      session.echo
    end
  end

  describe "#destroy" do
    it 'returns true when session is deleted' do
      session = Session.new
      session.authenticate(USERNAME, PASSWORD)
      expect(session.destroy).to be_true
    end

    it 'makes external an http call to the Session Destroy action' do
      session = Session.new
      session.authenticate(USERNAME, PASSWORD)

      json_response = http_message_from_file("session_destroy.json")
      expect_any_instance_of(HTTPClient).to receive(:get).with(Onsip::Actions::BASE, { :Action => "SessionDestroy", :SessionId => session.id, 
                                                                                       :Output => "json" }).and_return(json_response)
      session.destroy
    end
  end
end
