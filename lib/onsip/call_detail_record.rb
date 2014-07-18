class Onsip::CallDetailRecord < Onsip::RemoteResource

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

  def self.all
    self.new.where()
  end

  def self.where(options)
    instance = self.new
    return instance.where(options)
  end

  ##
  # INSTANCE METHODS
  #

  def where(options = {})
    query = {:Action => "CdrBrowse",
             :SessionId => Onsip::Session.instance.id }.merge(options)

    response = get(query)
    call_detail_records = response["Response"]["Result"]["CdrBrowse"]["Cdrs"]["Cdr"]

    call_detail_records.map do |call_detail_record|
      Onsip::CallDetailRecord.new(call_detail_record)
    end
  end

end
