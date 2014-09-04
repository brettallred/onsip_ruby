require 'spec_helper'

describe Onsip::CallDetailRecord do

  describe ".current_month" do
    it 'returns an array of Onsip::CallDetailRecord' do
      session = ::Onsip::Session.instance
      session.authenticate(::SpecHelper::USERNAME, ::SpecHelper::PASSWORD)
      call_detail_records = Onsip::CallDetailRecord.current_month
      expect(call_detail_records).to be_a(Array)
      expect(call_detail_records.first).to be_a(Onsip::CallDetailRecord)
    end
  end

end
