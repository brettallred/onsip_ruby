class Session

  def id 
    @id ||= session_response["Response"]["Context"]["Session"]["SessionId"]
  end

  def initialize
    @http_client = HTTPClient.new
  end

  def authenticate(username, password)
    result = @http_client.get(Onsip::Actions::BASE, { :Action => "SessionCreate",
                                                      :Output => "json",
                                                      :Username => username,
                                                      :Password => password })

    self.session_response = JSON.parse(result.content)
    return true
  end

  def echo 
    response = @http_client.get(Onsip::Actions::BASE, { :Action => "Echo", :Output => "json" })
    response_body = JSON.parse(response.content)
    return response_body
  end

  def destroy
  end


  private

  def session_response
    @session_response
  end

  def session_response=(session_response)
    @session_response = session_response
  end
end
