require 'singleton'

class Onsip::Session < Onsip::RemoteResource
  include ::Singleton

  ##
  # INSTANCE METHODS
  #
  def authenticate(username, password)

    get({ :Action => "SessionCreate",
          :Username => username,
          :Password => password })
    self.authenticated = true

    return authenticated? 
  end

  def authenticated?
    return @authenticated
  end

  def destroy
    get({ :Action => "SessionDestroy",
          :SessionId => id })


    return last_response["Response"]["Context"]["Session"]["IsEstablished"] == "false"
  end

  def echo 
    http_response = get({ :Action => "Echo" })
    return JSON.parse(http_response.content)
  end

  def id 
    @id ||= last_response["Response"]["Context"]["Session"]["SessionId"]
  end

  private 

  def authenticated=(authenticated)
    @authenticated = authenticated
  end

end
