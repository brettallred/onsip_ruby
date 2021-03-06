require 'spec_helper'

describe Onsip::Session do
  subject { Onsip::Session.instance }

  describe "#authenticate" do
    it 'returns a session id' do
      subject.authenticate(::SpecHelper::USERNAME, ::SpecHelper::PASSWORD)
      expect(subject.id).not_to be_nil
    end


    it 'sets authenticated? to true' do
      subject.authenticate(::SpecHelper::USERNAME, ::SpecHelper::PASSWORD)
      expect(subject.authenticated?).to be_true
    end
  end

  describe "#destroy" do
    it 'returns true when session is deleted' do
      subject.authenticate(::SpecHelper::USERNAME, ::SpecHelper::PASSWORD)
      expect(subject.destroy).to be_true
    end

    it 'sets authenticated? to false' do
      subject.authenticate(::SpecHelper::USERNAME, ::SpecHelper::PASSWORD)
      subject.destroy
      expect(subject.authenticated?).to be_false
    end

    it 'makes external an http call to the Session Destroy action' do
      subject.authenticate(::SpecHelper::USERNAME, ::SpecHelper::PASSWORD)

      json_response = http_message_from_file("session_destroy.json")
      expect_any_instance_of(HTTPClient).to receive(:get).with(Onsip::Actions::BASE, { :Action => "SessionDestroy", :SessionId => subject.id, 
                                                                                       :Output => "json" }).and_return(json_response)
      subject.destroy
    end
  end

  describe "#echo" do
    it 'returns a session id' do
      expect(subject.echo).to be_a(Hash)
    end

    it 'makes external an http call to the Echo action' do
      json_response = http_message_from_file("echo.json")
      expect_any_instance_of(HTTPClient).to receive(:get).with(Onsip::Actions::BASE, { :Action => "Echo", :Output => "json" }).and_return(json_response)
      subject.echo
    end
  end

end
