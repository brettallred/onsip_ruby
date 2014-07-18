class Session

  def id 
    @id ||= last_response["Response"]["Context"]["Session"]["SessionId"]
  end

  def initialize
    @http_client = HTTPClient.new
  end

  def authenticate(username, password)
    get({ :Action => "SessionCreate",
          :Output => "json",
          :Username => username,
          :Password => password })

    return true
  end

  def echo 
    http_response = @http_client.get(Onsip::Actions::BASE, { :Action => "Echo", :Output => "json" })
    return JSON.parse(http_response.content)
  end

  def destroy
    get({ :Action => "SessionDestroy",
          :Output => "json",
          :SessionId => id })

    return last_response["Response"]["Context"]["Session"]["IsEstablished"] == "false"
  end

  private

  def last_response
    @last_response
  end

  def last_response=(last_response)
    @last_response = last_response
  end

  def get(query_parameters)
    http_response = @http_client.get(Onsip::Actions::BASE, query_parameters)
    self.last_response = JSON.parse(http_response.content)
  end
end
