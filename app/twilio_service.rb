require 'twilio-ruby'

# put your own credentials here



  def send_invitation
    account_sid = 'AC5d11bdbcef24cf1c35b2cfc4ea880985'
    auth_token = 'fc5f3b1a34a740678c21ee7863e20b9f'
    #set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.api.account.messages.create(
      from: 'whatsapp:+14155238886',
      to: 'whatsapp:+33616051380',
      body: 'Salut. Cest moi'
    )
  end

send_invitation
