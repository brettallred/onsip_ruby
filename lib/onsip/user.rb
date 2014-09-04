module Onsip
  class User < ::Onsip::RemoteResource

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

    # http://developer.onsip.com/admin-api/Call-Detail-Records/
    def self.where(*options)
      instance = self.new
      return instance.where(options)
    end

    ##
    # INSTANCE METHODS
    #
    def where(query_options = {})
      number_of_records = count_remote_records(query_options)
      
      query = {:Action => "UserBrowse",
               :SessionId => Onsip::Session.instance.id,
               :Limit => number_of_records}.merge(query_options)

      response = get(query)

      users = response["Response"]["Result"]["UserBrowse"]["Users"]["User"]

      users.map do |user|
        Onsip::User.new(user)
      end
    end

    private 

    def count_remote_records(query_options = {})
      query = {:Action => "UserBrowse",
               :SessionId => Onsip::Session.instance.id,
               :CalcFound => true,
               :Limit => 1 }.merge(query_options)

      response = get(query)

      number_of_records = response["Response"]["Result"]["UserBrowse"]["Users"]["@attributes"]["Found"]
      return number_of_records.to_i
    end
  end
end
