class Session

  def id 
    @id ||= session_response["Response"]["Context"]["Session"]["SessionId"]
  end

  def initialize
    @http_client = HTTPClient.new
  end

  def authenticate(username, password)
    http_response = @http_client.get(Onsip::Actions::BASE, { :Action => "SessionCreate",
                                                             :Output => "json",
                                                             :Username => username,
                                                             :Password => password })

    self.session_response = JSON.parse(http_response.content)
    return true
  end

  def echo 
    http_response = @http_client.get(Onsip::Actions::BASE, { :Action => "Echo", :Output => "json" })
    return JSON.parse(http_response.content)
  end

  def destroy
    http_response = @http_client.get(Onsip::Actions::BASE, { :Action => "SessionDestroy",
                                                             :Output => "json",
                                                             :SessionId => id })

    self.session_response = JSON.parse(http_response.content)
    return true
  end

  private

  def session_response
    @session_response
  end

  def session_response=(session_response)
    @session_response = session_response
  end
end
