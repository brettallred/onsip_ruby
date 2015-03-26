module Onsip
  class CallDetailRecord < ::Onsip::RemoteResource

    ##
    # DYNAMIC ATTRIBUTES
    #
    # CdrId
    # UserId
    # DateTime
    # CallerId
    # Source
    # Destination
    # E164
    # Disposition
    # Length
    # Price
    # Cost
    # AnswerDateTime
    # EndDateTime
    # Routing

    ##
    # CLASS METHODS
    #

    def self.today
      self.new.where(:StartDateTime => DateTime.now.beginning_of_day, :EndDateTime => DateTime.now.end_of_day )
    end

    def self.last_hour
      self.new.where(:StartDateTime => DateTime.now - 60.minutes, :EndDateTime => DateTime.now )
    end
    
    def self.current_month
      self.new.where(:Offset => 0)
    end

    def self.last_month
      self.new.where(:Offset => -1)
    end
   
    # AccountId	 - A positive integer which references a unique Account.
    # OrganizationId	- A positive integer which references a unique Organization.
    # UserId -	A positive integer which references a unique User. 

    # MonthOffset -	A month offset into the history. 0 = current month, -1 = last month, -2 = two months ago, …
    # StartDateTime & EndDateTime	- DateTime range; StartDateTime <= DateTime < EndDateTime
    # StartCdrId & EndCdrId -	CdrId range; StartCdrId <= CdrId < EndCdrId


    # OrderBy	- CdrId | DateTime | Price
    # Limit	20	The maximum number of records to return.
    # Offset	0	The offset of the first record to return. The offset of the initial record is 0 (not 1).
    # CalcFound	true	Calculate how many records there would be in the result set, disregarding any Limit parameter.
    
    # http://developer.onsip.com/admin-api/Call-Detail-Records/
    def self.where(**options)
      instance = self.new
      return instance.where(options)
    end

    ##
    # INSTANCE METHODS
    #

    def where(query_options = {})
      #number_of_records = count_remote_records(query_options)
      
      query = {:Action => "CdrBrowse",
               :SessionId => Onsip::Session.instance.id,
               :Limit => 2500}.merge(query_options)

      response = get(query)

      errors = response["Response"]["Context"]["Request"]["Errors"]

      if errors.present?
        fail errors["Error"]["Message"]
      end

      call_detail_records = response["Response"]["Result"]["CdrBrowse"]["Cdrs"]["Cdr"]

      call_detail_records.map do |call_detail_record|
        Onsip::CallDetailRecord.new(call_detail_record)
      end
    end

    private 

    def count_remote_records(query_options = {})
      query = {:Action => "CdrBrowse",
               :SessionId => Onsip::Session.instance.id,
               :CalcFound => true,
               :Limit => 1 }.merge(query_options)

      response = get(query)

      number_of_records = response["Response"]["Result"]["CdrBrowse"]["Cdrs"]["@attributes"]["Found"]
      return number_of_records.to_i
    end
  end
end
