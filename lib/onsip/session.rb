class Session
  attr_accessor :id

  def initialize
    @http_client = HTTPClient.new
  end

  def authenticate(username, password)
    result = @http_client.get(Onsip::BASE_URL)
  end

  def echo 
    result = @http_client.get(Onsip::Actions::ECHO)
    return result
  end

  def destroy
  end

end
