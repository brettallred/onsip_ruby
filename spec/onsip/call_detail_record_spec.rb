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


  describe ".today" do
    it 'returns an array of Onsip::CallDetailRecord' do
      session = ::Onsip::Session.instance
      session.authenticate(::SpecHelper::USERNAME, ::SpecHelper::PASSWORD)
      call_detail_records = Onsip::CallDetailRecord.today
      puts call_detail_records.count
      any_records_before_today = call_detail_records.any? { |cdr| cdr.DateTime < DateTime.now.beginning_of_day }
      expect(any_records_before_today).to be false
    end
  end

  describe ".last_hour" do
    it 'returns an array of Onsip::CallDetailRecord' do
      session = ::Onsip::Session.instance
      session.authenticate(::SpecHelper::USERNAME, ::SpecHelper::PASSWORD)
      call_detail_records = Onsip::CallDetailRecord.last_hour
      puts call_detail_records.count
      any_records_before_today = call_detail_records.any? { |cdr| cdr.DateTime < DateTime.now.beginning_of_day }
      expect(any_records_before_today).to be false
    end
  end

  describe ".where" do
    it 'returns a maximum of 2500 of Onsip::CallDetailRecord' do
      session = ::Onsip::Session.instance
      session.authenticate(::SpecHelper::USERNAME, ::SpecHelper::PASSWORD)
      call_detail_records = ::Onsip::CallDetailRecord.where(:StartDateTime => DateTime.now - 6.months, :EndDateTime => DateTime.now)
      expect(call_detail_records.count).to equal(2500)
    end
  end

end
