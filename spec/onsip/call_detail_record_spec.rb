require 'spec_helper'

describe Onsip::CallDetailRecord do

  describe ".all" do
    it 'returns an array of Onsip::CallDetailRecord' do
      Onsip::Session.instance.authenticate(::SpecHelper::USERNAME, ::SpecHelper::PASSWORD)
      call_detail_records = Onsip::CallDetailRecord.all
      expect(call_detail_records).to be_a(Array)
      expect(call_detail_records.first).to be_a(Onsip::CallDetailRecord)
    end
  end

end
