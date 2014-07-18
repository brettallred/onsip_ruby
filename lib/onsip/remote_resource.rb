class Onsip::RemoteResource

  ## 
  # CONSTRUCTOR
  #
  def initialize(attributes = nil)
    @attributes = attributes
  end

  def method_missing(name, *args, &blk)
    name = name.to_s
    if args.empty? && blk.nil? && @attributes.has_key?(name)
      @attributes[name]
    else
      super
    end
  end

  private 

  def http_client
    @http_client ||= HTTPClient.new
  end

  def last_response
    @last_response
  end

  def last_response=(last_response)
    @last_response = last_response
  end

  def get(query_parameters)
    http_response = http_client.get(Onsip::Actions::BASE, query_parameters.merge({:Output => "json"}))

    #TODO: Handle HTTP Response Errors
    self.last_response = JSON.parse(http_response.content)
  end


end
