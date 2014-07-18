class Session

  ## 
  # CONSTRUCTOR
  #
  def initialize
    @http_client = HTTPClient.new
  end

  ##
  # INSTANCE METHODS
  #
  def authenticate(username, password)
    get({ :Action => "SessionCreate",
          :Username => username,
          :Password => password })

    return true
  end

  def destroy
    get({ :Action => "SessionDestroy",
          :SessionId => id })


    return last_response["Response"]["Context"]["Session"]["IsEstablished"] == "false"
  end

  def echo 
    http_response = @http_client.get(Onsip::Actions::BASE, { :Action => "Echo", :Output => "json" })
    return JSON.parse(http_response.content)
  end

  def id 
    @id ||= last_response["Response"]["Context"]["Session"]["SessionId"]
  end

  private

  def last_response
    @last_response
  end

  def last_response=(last_response)
    @last_response = last_response
  end

  def get(query_parameters)
    http_response = @http_client.get(Onsip::Actions::BASE, query_parameters.merge({:Output => "json"}))
   
    #TODO: Handle HTTP Response Errors
    self.last_response = JSON.parse(http_response.content)
  end
end
