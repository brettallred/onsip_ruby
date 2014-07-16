require 'spec_helper'

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

  describe "#destroy" do
  end

end
